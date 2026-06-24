using System;

namespace backend.Data
{
    public class Council
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
    }

    public class Member
    {
        public int Id { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public DateTime DateOfBirth { get; set; }
        public string MemberNumber { get; set; } = string.Empty;
        public int CouncilId { get; set; }
        public bool IsPaid { get; set; }
        public string Status { get; set; } = "Active";
    }

    public class Transaction
    {
        public string Id { get; set; } = string.Empty;
        public int CouncilId { get; set; }
        public string Type { get; set; } = string.Empty; // INCOME or EXPENSE
        public decimal Amount { get; set; }
        public string Description { get; set; } = string.Empty;
        public string? CheckNumber { get; set; }
        public int? LinkedMemberId { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }

    public class ProgramActivity
    {
        public string Id { get; set; } = string.Empty;
        public int CouncilId { get; set; }
        public string SubmitterMemberNumber { get; set; } = string.Empty;
        public int Category { get; set; } // 1=FAITH, 2=FAMILY, 3=COMMUNITY, 4=LIFE
        public string ActivityName { get; set; } = string.Empty;
        public DateTime EventDate { get; set; }
        public int VolunteerCount { get; set; }
        public int VolunteerHours { get; set; }
        public decimal MoneyDonated { get; set; }
        public decimal MoneyRaised { get; set; }
        public string Description { get; set; } = string.Empty;
        public int Status { get; set; } // 1=DRAFT, 2=PENDING_SYNC, 3=SUBMITTED
        public string? SupremeConfirmationNumber { get; set; }
    }
}
