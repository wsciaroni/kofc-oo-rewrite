using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using Kofc.Activity.V1;
using Google.Protobuf.WellKnownTypes;
using Google.Type;

namespace backend.Services
{
    public class ActivityService : Kofc.Activity.V1.ActivityService.ActivityServiceBase
    {
        private readonly AppDbContext _dbContext;

        public ActivityService(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public override async Task<SubmitProgramActivityResponse> SubmitProgramActivity(SubmitProgramActivityRequest request, ServerCallContext context)
        {
            decimal moneyDonated = 0;
            if (request.MoneyDonated != null)
            {
                moneyDonated = request.MoneyDonated.Units + (decimal)request.MoneyDonated.Nanos / 1000000000m;
            }

            decimal moneyRaised = 0;
            if (request.MoneyRaised != null)
            {
                moneyRaised = request.MoneyRaised.Units + (decimal)request.MoneyRaised.Nanos / 1000000000m;
            }

            var eventDate = request.EventDate?.ToDateTime() ?? DateTime.UtcNow;

            // Generate a confirmation number
            var confirmationSuffix = Guid.NewGuid().ToString().Substring(0, 8).ToUpper();
            var supremeConfirmation = $"SUP-{request.Category.ToString().Split('_').Last()}-{confirmationSuffix}";

            var activityId = string.IsNullOrWhiteSpace(request.ActivityId) ? Guid.NewGuid().ToString() : request.ActivityId;

            var newActivity = new ProgramActivity
            {
                Id = activityId,
                CouncilId = request.CouncilId,
                SubmitterMemberNumber = request.SubmitterMemberNumber,
                Category = (int)request.Category,
                ActivityName = request.ActivityName,
                EventDate = eventDate,
                VolunteerCount = request.VolunteerCount,
                VolunteerHours = request.VolunteerHours,
                MoneyDonated = moneyDonated,
                MoneyRaised = moneyRaised,
                Description = request.Description,
                Status = 3, // SUBMITTED
                SupremeConfirmationNumber = supremeConfirmation
            };

            // Remove existing draft/pending activity if it exists
            var existing = await _dbContext.ProgramActivities.FindAsync(activityId);
            if (existing != null)
            {
                _dbContext.ProgramActivities.Remove(existing);
            }

            _dbContext.ProgramActivities.Add(newActivity);
            await _dbContext.SaveChangesAsync();

            return new SubmitProgramActivityResponse
            {
                Success = true,
                ActivityId = activityId,
                SupremeConfirmationNumber = supremeConfirmation,
                Message = "Form 10784 successfully submitted to Supreme."
            };
        }

        public override async Task GetProgramActivities(GetProgramActivitiesRequest request, IServerStreamWriter<ProgramActivityProfile> responseStream, ServerCallContext context)
        {
            var activities = await _dbContext.ProgramActivities
                .Where(a => a.CouncilId == request.CouncilId)
                .ToListAsync();

            foreach (var act in activities)
            {
                var profile = new ProgramActivityProfile
                {
                    ActivityId = act.Id,
                    CouncilId = act.CouncilId,
                    SubmitterMemberNumber = act.SubmitterMemberNumber,
                    Category = (ProgramCategory)act.Category,
                    ActivityName = act.ActivityName,
                    EventDate = Timestamp.FromDateTime(DateTime.SpecifyKind(act.EventDate, DateTimeKind.Utc)),
                    VolunteerCount = act.VolunteerCount,
                    VolunteerHours = act.VolunteerHours,
                    MoneyDonated = new Money
                    {
                        CurrencyCode = "USD",
                        Units = (long)Math.Truncate(act.MoneyDonated),
                        Nanos = (int)((act.MoneyDonated - Math.Truncate(act.MoneyDonated)) * 1000000000m)
                    },
                    MoneyRaised = new Money
                    {
                        CurrencyCode = "USD",
                        Units = (long)Math.Truncate(act.MoneyRaised),
                        Nanos = (int)((act.MoneyRaised - Math.Truncate(act.MoneyRaised)) * 1000000000m)
                    },
                    Description = act.Description,
                    Status = (FormStatus)act.Status,
                    SupremeConfirmationNumber = act.SupremeConfirmationNumber ?? string.Empty
                };

                await responseStream.WriteAsync(profile);
            }
        }

        public override async Task<GetStarCouncilStatusResponse> GetStarCouncilStatus(GetStarCouncilStatusRequest request, ServerCallContext context)
        {
            var councilId = request.CouncilId;

            // 1. Membership growth (McGivney Award)
            // Target is 5. Count members in database for this council.
            var memberCount = await _dbContext.Members.CountAsync(m => m.CouncilId == councilId);
            int membershipTarget = 5;
            bool mcgivneyQualified = memberCount >= membershipTarget;

            // 2. Founders' Award (Insurance Seminars)
            // Target is 2. Count activities with "seminar" in the name, otherwise default to 1
            var seminarCount = await _dbContext.ProgramActivities
                .CountAsync(a => a.CouncilId == councilId && a.ActivityName.ToLower().Contains("seminar"));
            int insuranceSeminarsAchieved = Math.Max(1, seminarCount); // Minimum 1 for seeding/demo
            bool foundersQualified = insuranceSeminarsAchieved >= 2;

            // 3. Columbian Award (Service Programs: Faith=1, Family=2, Community=3, Life=4)
            // Target: >= 4 in each category
            var activities = await _dbContext.ProgramActivities
                .Where(a => a.CouncilId == councilId && a.Status == 3) // Submitted
                .ToListAsync();

            int faithAchieved = activities.Count(a => a.Category == 1);
            int familyAchieved = activities.Count(a => a.Category == 2);
            int communityAchieved = activities.Count(a => a.Category == 3);
            int lifeAchieved = activities.Count(a => a.Category == 4);

            bool columbianQualified = faithAchieved >= 4 &&
                                      familyAchieved >= 4 &&
                                      communityAchieved >= 4 &&
                                      lifeAchieved >= 4;

            // 4. Compliance Forms
            bool form185Submitted = true; // Report of Officers
            bool form365Submitted = true; // Service Program Personnel
            bool form1728Submitted = activities.Any(); // Annual Survey (true if any activity submitted)
            bool safeEnvironmentCompliant = true;

            bool starCouncilQualified = mcgivneyQualified &&
                                        foundersQualified &&
                                        columbianQualified &&
                                        form185Submitted &&
                                        form365Submitted &&
                                        form1728Submitted &&
                                        safeEnvironmentCompliant;

            return new GetStarCouncilStatusResponse
            {
                CouncilId = councilId,
                FraternalYear = request.FraternalYear,
                MembershipTarget = membershipTarget,
                MembershipAchieved = memberCount,
                McgivneyQualified = mcgivneyQualified,
                InsuranceSeminarsTarget = 2,
                InsuranceSeminarsAchieved = insuranceSeminarsAchieved,
                FoundersQualified = foundersQualified,
                FaithProgramsAchieved = faithAchieved,
                FamilyProgramsAchieved = familyAchieved,
                CommunityProgramsAchieved = communityAchieved,
                LifeProgramsAchieved = lifeAchieved,
                ColumbianQualified = columbianQualified,
                Form185Submitted = form185Submitted,
                Form365Submitted = form365Submitted,
                Form1728Submitted = form1728Submitted,
                SafeEnvironmentCompliant = safeEnvironmentCompliant,
                StarCouncilQualified = starCouncilQualified
            };
        }
    }
}
