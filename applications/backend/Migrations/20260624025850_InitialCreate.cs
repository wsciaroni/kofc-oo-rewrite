using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace backend.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Councils",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Councils", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Members",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    FirstName = table.Column<string>(type: "TEXT", nullable: false),
                    LastName = table.Column<string>(type: "TEXT", nullable: false),
                    DateOfBirth = table.Column<DateTime>(type: "TEXT", nullable: false),
                    MemberNumber = table.Column<string>(type: "TEXT", nullable: false),
                    CouncilId = table.Column<int>(type: "INTEGER", nullable: false),
                    IsPaid = table.Column<bool>(type: "INTEGER", nullable: false),
                    Status = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Members", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "ProgramActivities",
                columns: table => new
                {
                    Id = table.Column<string>(type: "TEXT", nullable: false),
                    CouncilId = table.Column<int>(type: "INTEGER", nullable: false),
                    SubmitterMemberNumber = table.Column<string>(type: "TEXT", nullable: false),
                    Category = table.Column<int>(type: "INTEGER", nullable: false),
                    ActivityName = table.Column<string>(type: "TEXT", nullable: false),
                    EventDate = table.Column<DateTime>(type: "TEXT", nullable: false),
                    VolunteerCount = table.Column<int>(type: "INTEGER", nullable: false),
                    VolunteerHours = table.Column<int>(type: "INTEGER", nullable: false),
                    MoneyDonated = table.Column<decimal>(type: "TEXT", nullable: false),
                    MoneyRaised = table.Column<decimal>(type: "TEXT", nullable: false),
                    Description = table.Column<string>(type: "TEXT", nullable: false),
                    Status = table.Column<int>(type: "INTEGER", nullable: false),
                    SupremeConfirmationNumber = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProgramActivities", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Transactions",
                columns: table => new
                {
                    Id = table.Column<string>(type: "TEXT", nullable: false),
                    CouncilId = table.Column<int>(type: "INTEGER", nullable: false),
                    Type = table.Column<string>(type: "TEXT", nullable: false),
                    Amount = table.Column<decimal>(type: "TEXT", nullable: false),
                    Description = table.Column<string>(type: "TEXT", nullable: false),
                    CheckNumber = table.Column<string>(type: "TEXT", nullable: true),
                    LinkedMemberId = table.Column<int>(type: "INTEGER", nullable: true),
                    CreatedAt = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Transactions", x => x.Id);
                });

            migrationBuilder.InsertData(
                table: "Councils",
                columns: new[] { "Id", "Name" },
                values: new object[] { 1000, "Star Council #1000" });

            migrationBuilder.InsertData(
                table: "Members",
                columns: new[] { "Id", "CouncilId", "DateOfBirth", "FirstName", "IsPaid", "LastName", "MemberNumber", "Status" },
                values: new object[,]
                {
                    { 1, 1000, new DateTime(1980, 5, 15, 0, 0, 0, 0, DateTimeKind.Utc), "John", true, "Doe", "1234567", "Active" },
                    { 2, 1000, new DateTime(1985, 8, 20, 0, 0, 0, 0, DateTimeKind.Utc), "Jane", false, "Smith", "2345678", "Active" },
                    { 3, 1000, new DateTime(1990, 11, 10, 0, 0, 0, 0, DateTimeKind.Utc), "Bob", true, "Johnson", "3456789", "Active" },
                    { 4, 1000, new DateTime(1975, 2, 25, 0, 0, 0, 0, DateTimeKind.Utc), "Alice", false, "Williams", "4567890", "Associate" }
                });

            migrationBuilder.InsertData(
                table: "ProgramActivities",
                columns: new[] { "Id", "ActivityName", "Category", "CouncilId", "Description", "EventDate", "MoneyDonated", "MoneyRaised", "Status", "SubmitterMemberNumber", "SupremeConfirmationNumber", "VolunteerCount", "VolunteerHours" },
                values: new object[,]
                {
                    { "act-seed-1", "Vocations Support RSVVP", 1, 1000, "Supported vocations via RSVP project.", new DateTime(2026, 2, 10, 0, 0, 0, 0, DateTimeKind.Utc), 500.00m, 0.00m, 3, "1234567", "SUP-F000001", 15, 45 },
                    { "act-seed-2", "Family Week Picnic", 2, 1000, "Held our annual family picnic.", new DateTime(2026, 3, 15, 0, 0, 0, 0, DateTimeKind.Utc), 150.00m, 250.00m, 3, "1234567", "SUP-FAM0001", 20, 60 },
                    { "act-seed-3", "Parish Food Drive", 3, 1000, "Parish food drive collecting non-perishables.", new DateTime(2026, 4, 20, 0, 0, 0, 0, DateTimeKind.Utc), 100.00m, 1200.00m, 3, "2345678", "SUP-COM0001", 12, 36 },
                    { "act-seed-4", "March for Life Transportation Support", 4, 1000, "Sponsored bus travel to the March for Life.", new DateTime(2026, 1, 22, 0, 0, 0, 0, DateTimeKind.Utc), 300.00m, 0.00m, 3, "3456789", "SUP-L000001", 8, 16 }
                });

            migrationBuilder.InsertData(
                table: "Transactions",
                columns: new[] { "Id", "Amount", "CheckNumber", "CouncilId", "CreatedAt", "Description", "LinkedMemberId", "Type" },
                values: new object[,]
                {
                    { "tx-seed-1", 1200.00m, null, 1000, new DateTime(2026, 4, 20, 0, 0, 0, 0, DateTimeKind.Utc), "Proceeds from Parish Food Drive", null, "INCOME" },
                    { "tx-seed-2", 300.00m, null, 1000, new DateTime(2026, 1, 22, 0, 0, 0, 0, DateTimeKind.Utc), "Bus sponsorship for March for Life", null, "EXPENSE" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Councils");

            migrationBuilder.DropTable(
                name: "Members");

            migrationBuilder.DropTable(
                name: "ProgramActivities");

            migrationBuilder.DropTable(
                name: "Transactions");
        }
    }
}
