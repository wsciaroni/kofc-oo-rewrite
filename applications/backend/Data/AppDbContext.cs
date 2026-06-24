using Microsoft.EntityFrameworkCore;
using System;

namespace backend.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Council> Councils => Set<Council>();
        public DbSet<Member> Members => Set<Member>();
        public DbSet<Transaction> Transactions => Set<Transaction>();
        public DbSet<ProgramActivity> ProgramActivities => Set<ProgramActivity>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure primary keys and relationships
            modelBuilder.Entity<Council>().HasKey(c => c.Id);
            modelBuilder.Entity<Member>().HasKey(m => m.Id);
            modelBuilder.Entity<Transaction>().HasKey(t => t.Id);
            modelBuilder.Entity<ProgramActivity>().HasKey(p => p.Id);

            // Seed initial data
            modelBuilder.Entity<Council>().HasData(
                new Council { Id = 1000, Name = "Star Council #1000" }
            );

            modelBuilder.Entity<Member>().HasData(
                new Member
                {
                    Id = 1,
                    FirstName = "John",
                    LastName = "Doe",
                    DateOfBirth = new DateTime(1980, 5, 15, 0, 0, 0, DateTimeKind.Utc),
                    MemberNumber = "1234567",
                    CouncilId = 1000,
                    IsPaid = true,
                    Status = "Active"
                },
                new Member
                {
                    Id = 2,
                    FirstName = "Jane",
                    LastName = "Smith",
                    DateOfBirth = new DateTime(1985, 8, 20, 0, 0, 0, DateTimeKind.Utc),
                    MemberNumber = "2345678",
                    CouncilId = 1000,
                    IsPaid = false,
                    Status = "Active"
                },
                new Member
                {
                    Id = 3,
                    FirstName = "Bob",
                    LastName = "Johnson",
                    DateOfBirth = new DateTime(1990, 11, 10, 0, 0, 0, DateTimeKind.Utc),
                    MemberNumber = "3456789",
                    CouncilId = 1000,
                    IsPaid = true,
                    Status = "Active"
                },
                new Member
                {
                    Id = 4,
                    FirstName = "Alice",
                    LastName = "Williams",
                    DateOfBirth = new DateTime(1975, 2, 25, 0, 0, 0, DateTimeKind.Utc),
                    MemberNumber = "4567890",
                    CouncilId = 1000,
                    IsPaid = false,
                    Status = "Associate"
                }
            );

            modelBuilder.Entity<ProgramActivity>().HasData(
                new ProgramActivity
                {
                    Id = "act-seed-1",
                    CouncilId = 1000,
                    SubmitterMemberNumber = "1234567",
                    Category = 1, // FAITH
                    ActivityName = "Vocations Support RSVVP",
                    EventDate = new DateTime(2026, 2, 10, 0, 0, 0, DateTimeKind.Utc),
                    VolunteerCount = 15,
                    VolunteerHours = 45,
                    MoneyDonated = 500.00m,
                    MoneyRaised = 0.00m,
                    Description = "Supported vocations via RSVP project.",
                    Status = 3, // SUBMITTED
                    SupremeConfirmationNumber = "SUP-F000001"
                },
                new ProgramActivity
                {
                    Id = "act-seed-2",
                    CouncilId = 1000,
                    SubmitterMemberNumber = "1234567",
                    Category = 2, // FAMILY
                    ActivityName = "Family Week Picnic",
                    EventDate = new DateTime(2026, 3, 15, 0, 0, 0, DateTimeKind.Utc),
                    VolunteerCount = 20,
                    VolunteerHours = 60,
                    MoneyDonated = 150.00m,
                    MoneyRaised = 250.00m,
                    Description = "Held our annual family picnic.",
                    Status = 3, // SUBMITTED
                    SupremeConfirmationNumber = "SUP-FAM0001"
                },
                new ProgramActivity
                {
                    Id = "act-seed-3",
                    CouncilId = 1000,
                    SubmitterMemberNumber = "2345678",
                    Category = 3, // COMMUNITY
                    ActivityName = "Parish Food Drive",
                    EventDate = new DateTime(2026, 4, 20, 0, 0, 0, DateTimeKind.Utc),
                    VolunteerCount = 12,
                    VolunteerHours = 36,
                    MoneyDonated = 100.00m,
                    MoneyRaised = 1200.00m,
                    Description = "Parish food drive collecting non-perishables.",
                    Status = 3, // SUBMITTED
                    SupremeConfirmationNumber = "SUP-COM0001"
                },
                new ProgramActivity
                {
                    Id = "act-seed-4",
                    CouncilId = 1000,
                    SubmitterMemberNumber = "3456789",
                    Category = 4, // LIFE
                    ActivityName = "March for Life Transportation Support",
                    EventDate = new DateTime(2026, 1, 22, 0, 0, 0, DateTimeKind.Utc),
                    VolunteerCount = 8,
                    VolunteerHours = 16,
                    MoneyDonated = 300.00m,
                    MoneyRaised = 0.00m,
                    Description = "Sponsored bus travel to the March for Life.",
                    Status = 3, // SUBMITTED
                    SupremeConfirmationNumber = "SUP-L000001"
                }
            );

            modelBuilder.Entity<Transaction>().HasData(
                new Transaction
                {
                    Id = "tx-seed-1",
                    CouncilId = 1000,
                    Type = "INCOME",
                    Amount = 1200.00m,
                    Description = "Proceeds from Parish Food Drive",
                    CreatedAt = new DateTime(2026, 4, 20, 0, 0, 0, DateTimeKind.Utc)
                },
                new Transaction
                {
                    Id = "tx-seed-2",
                    CouncilId = 1000,
                    Type = "EXPENSE",
                    Amount = 300.00m,
                    Description = "Bus sponsorship for March for Life",
                    CreatedAt = new DateTime(2026, 1, 22, 0, 0, 0, DateTimeKind.Utc)
                }
            );
        }
    }
}
