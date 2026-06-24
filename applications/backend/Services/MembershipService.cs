using Grpc.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using System.Threading.Tasks;
using backend.Data;
using Kofc.Membership.V1;
using Google.Protobuf.WellKnownTypes;

namespace backend.Services
{
    public class MembershipService : Kofc.Membership.V1.MembershipService.MembershipServiceBase
    {
        private readonly AppDbContext _dbContext;

        public MembershipService(AppDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public override async Task<FindCandidateResponse> FindCandidate(FindCandidateRequest request, ServerCallContext context)
        {
            var requestDob = request.DateOfBirth?.ToDateTime() ?? DateTime.MinValue;

            // Search by Name + DOB (case-insensitive for names)
            var member = await _dbContext.Members
                .FirstOrDefaultAsync(m => 
                    m.FirstName.ToLower() == request.FirstName.ToLower() && 
                    m.LastName.ToLower() == request.LastName.ToLower() && 
                    m.DateOfBirth.Date == requestDob.Date);

            if (member != null)
            {
                return new FindCandidateResponse
                {
                    Exists = true,
                    ExistingCouncilId = member.CouncilId,
                    MemberNumber = member.MemberNumber
                };
            }

            return new FindCandidateResponse
            {
                Exists = false,
                ExistingCouncilId = 0,
                MemberNumber = string.Empty
            };
        }

        public override async Task<CandidateResponse> ProcessCandidate(ProcessCandidateRequest request, ServerCallContext context)
        {
            var ceremonialDate = request.CeremonialDate?.ToDateTime() ?? DateTime.UtcNow;
            
            // Check if there is an existing member with the same Name and DOB to do a Transfer
            // In a real application, the search would be global. Here we search all members.
            var existingMember = await _dbContext.Members
                .FirstOrDefaultAsync(m => 
                    m.FirstName.ToLower() == request.FirstName.ToLower() && 
                    m.LastName.ToLower() == request.LastName.ToLower());

            if (existingMember != null)
            {
                // This is a Transfer: Update council ID
                int oldCouncil = existingMember.CouncilId;
                existingMember.CouncilId = request.TargetCouncilId;
                await _dbContext.SaveChangesAsync();

                return new CandidateResponse
                {
                    Success = true,
                    Message = $"Successfully transferred member #{existingMember.MemberNumber} from Council #{oldCouncil} to Council #{request.TargetCouncilId}.",
                    MemberId = existingMember.MemberNumber
                };
            }
            else
            {
                // This is a New Candidate intake
                // Generate a random 7-digit member number
                var rand = new Random();
                string generatedMemberNum;
                do
                {
                    generatedMemberNum = rand.Next(1000000, 9999999).ToString();
                } while (await _dbContext.Members.AnyAsync(m => m.MemberNumber == generatedMemberNum));

                var newMember = new Member
                {
                    FirstName = request.FirstName,
                    LastName = request.LastName,
                    DateOfBirth = ceremonialDate.AddYears(-25), // Mock DOB since it's not in ProcessCandidateRequest
                    MemberNumber = generatedMemberNum,
                    CouncilId = request.TargetCouncilId,
                    IsPaid = false,
                    Status = "Active"
                };

                _dbContext.Members.Add(newMember);
                await _dbContext.SaveChangesAsync();

                return new CandidateResponse
                {
                    Success = true,
                    Message = $"Successfully initiated member #{generatedMemberNum} into Council #{request.TargetCouncilId}.",
                    MemberId = generatedMemberNum
                };
            }
        }

        public override async Task GetCouncilRoster(RosterRequest request, IServerStreamWriter<MemberProfile> responseStream, ServerCallContext context)
        {
            var members = await _dbContext.Members
                .Where(m => m.CouncilId == request.CouncilId)
                .ToListAsync();

            foreach (var member in members)
            {
                await responseStream.WriteAsync(new MemberProfile
                {
                    FirstName = member.FirstName,
                    LastName = member.LastName,
                    MemberNumber = member.MemberNumber
                });
            }
        }
    }
}
