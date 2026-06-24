# Development Plan: Officers Online (Next Gen)

This document outlines the step-by-step development plan to move the "Officers Online" project from its current skeletal state to a fully featured application satisfying the Software Requirements Specification (SRS).

---

## Phase 1: Foundation & Connectivity

### Task 1.1: Proto Vendor & Compilation
*   **Dependencies:** None.
*   **Acceptance Criteria:**
    *   `google/type/money.proto` exists in `protos/google/type/`.
    *   Backend builds and generates C# classes from protos.
    *   Frontend builds and generates Dart classes from protos.
*   **Description:**
    1.  Download `money.proto` from the Google APIs repository and place it in the correct directory structure under `protos/`.
    2.  Update `applications/backend/backend.csproj` to include `<Protobuf Include="../../protos/*.proto" GrpcServices="Server" />`.
    3.  Update `applications/frontend/pubspec.yaml` to include `grpc`, `protobuf`, `protoc_plugin` (dev).
    4.  Create a script `applications/frontend/generate_protos.sh` to compile protos to Dart.
    5.  Execute build commands to verify generation.
    6.  **Definition of Done:**
        *   **Documentation:** Update project READMEs to document the proto generation process.
        *   **Unit Tests:** N/A for configuration, but verify build scripts exit with success.
        *   **Integration Tests:** Verify `protoc` command runs successfully in the CI environment.
        *   **Static Analysis:** Ensure generated code does not trigger linter errors (add ignores if necessary).

### Task 1.2: Backend gRPC Infrastructure
*   **Dependencies:** Task 1.1.
*   **Acceptance Criteria:**
    *   Backend runs on a specified port (e.g., 5000) with HTTP/2 enabled.
    *   `MembershipService` and `FinanceService` are registered in `Program.cs`.
    *   Calling a gRPC endpoint returns a response (even if "Unimplemented").
*   **Description:**
    1.  Add `Grpc.AspNetCore` package to Backend.
    2.  Create `Services/MembershipService.cs` inheriting from the generated base. Implement dummy methods.
    3.  Create `Services/FinanceService.cs` inheriting from the generated base. Implement dummy methods.
    4.  Configure Kestrel in `appsettings.json` for HTTP/2.
    5.  Map gRPC services in `Program.cs`.
    6.  **Definition of Done:**
        *   **Documentation:** Document the service registration pattern in `AGENTS.md`.
        *   **Unit Tests:** Add unit tests for `MembershipService` ensuring it returns appropriate status codes.
        *   **Integration Tests:** Create a test that starts the server and pings a dummy endpoint.
        *   **Static Analysis:** Run `dotnet build` and ensure 0 warnings.

### Task 1.3: Frontend gRPC Infrastructure
*   **Dependencies:** Task 1.1.
*   **Acceptance Criteria:**
    *   Frontend app compiles.
    *   A singleton `GrpcClientFactory` or similar provider exists.
    *   App can successfully connect to the running local Backend.
*   **Description:**
    1.  Create `lib/core/network/grpc_client_provider.dart` to manage the `ClientChannel`.
    2.  Create a temporary "Ping" button on the home screen that calls `GetCouncilRoster` (or any valid RPC) and prints the result/error to console.
    3.  Ensure connectivity works (handle CORS or proxy if testing Web, or localhost networking for Mobile).
    4.  **Definition of Done:**
        *   **Documentation:** Document how to configure the backend URL in the frontend.
        *   **Unit Tests:** Test the `GrpcClientProvider` configuration logic.
        *   **Integration Tests:** Verify the app can connect to a mock gRPC server.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

---

## Phase 2: Membership Module (Core)

### Task 2.1: Backend - Membership Data Layer
*   **Dependencies:** Task 1.2.
*   **Acceptance Criteria:**
    *   SQLite database configured with EF Core.
    *   `Member` and `Council` entities created.
    *   Migrations applied.
    *   `GetCouncilRoster` returns data from DB.
*   **Description:**
    1.  Add `Microsoft.EntityFrameworkCore.Sqlite`.
    2.  Create `Data/AppDbContext.cs`.
    3.  Define `Member` entity (Id, FirstName, LastName, MemberNumber, CouncilId, Status, PhotoUrl, etc.).
    4.  Run `dotnet ef migrations add InitialCreate`.
    5.  Implement `GetCouncilRoster` in `MembershipService` to query the DB and map to Proto objects.
    6.  Seed the DB with dummy data for testing.
    7.  **Definition of Done:**
        *   **Documentation:** Document the DB schema and migration steps.
        *   **Unit Tests:** Test the repository/service logic with an in-memory database.
        *   **Integration Tests:** Verify `GetCouncilRoster` returns the seeded data via gRPC.
        *   **Static Analysis:** Run `dotnet build` and ensure 0 warnings.

### Task 2.2: Frontend - Membership State & Roster
*   **Dependencies:** Task 1.3, Task 2.1.
*   **Acceptance Criteria:**
    *   Roster Screen displays list of members.
    *   Bloc/Cubit manages loading/success/error states.
*   **Description:**
    1.  Create `lib/features/membership/domain/repositories/membership_repository.dart`.
    2.  Create `lib/features/membership/presentation/bloc/roster_bloc.dart`.
    3.  Create `lib/features/membership/presentation/screens/roster_screen.dart`.
    4.  Implement UI with `ListView`.
    5.  Connect Bloc to gRPC client.
    6.  **Definition of Done:**
        *   **Documentation:** Document the BLoC state flow.
        *   **Unit Tests:** Test `RosterBloc` states (Loading -> Loaded) and `MembershipRepository`.
        *   **Integration Tests:** Widget test for `RosterScreen` ensuring list renders.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

### Task 2.3: Frontend - Digital Membership Card
*   **Dependencies:** Task 2.2.
*   **Acceptance Criteria:**
    *   Tapping a member in Roster opens Detail/Card view.
    *   Card displays: Name, Member #, Degree, Status.
    *   Visuals match "Digital Card" concept.
*   **Description:**
    1.  Create `MemberDetailScreen` or `DigitalCardWidget`.
    2.  Pass `MemberProfile` object to the view.
    3.  Style it to look like a physical card.
    4.  **Definition of Done:**
        *   **Documentation:** Add screenshots of the Digital Card to documentation.
        *   **Unit Tests:** Test data parsing for the card widget.
        *   **Integration Tests:** Widget test checking all fields (Name, #) are displayed correctly.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

---

## Phase 3: Membership Operations (Intake)

### Task 3.1: Backend - Intake Logic
*   **Dependencies:** Task 2.1.
*   **Acceptance Criteria:**
    *   `FindCandidate` accurately finds member by Name+DOB (mock "Supreme" check against local DB for now).
    *   `ProcessCandidate` creates new record or updates existing one (Transfer).
*   **Description:**
    1.  Implement `FindCandidate`: Query DB for Name + DOB. Return `exists=true` if found.
    2.  Implement `ProcessCandidate`:
        *   If new: `db.Members.Add(...)`.
        *   If transfer: Update `CouncilId` of existing member.
        *   Save changes.
    3.  **Definition of Done:**
        *   **Documentation:** Document the intake/transfer logic flow.
        *   **Unit Tests:** Test `FindCandidate` (Found vs Not Found) and `ProcessCandidate` logic.
        *   **Integration Tests:** End-to-end test of adding a new candidate via gRPC.
        *   **Static Analysis:** Run `dotnet build` and ensure 0 warnings.

### Task 3.2: Frontend - Intake Wizard
*   **Dependencies:** Task 3.1.
*   **Acceptance Criteria:**
    *   "Add Candidate" button on Roster.
    *   Step 1: Input Name/DOB. Call `FindCandidate`.
    *   Step 2: Show "New" or "Transfer" flow based on response.
    *   Step 3: Submit calls `ProcessCandidate`.
*   **Description:**
    1.  Create `CandidateIntakeScreen`.
    2.  Implement Form validation.
    3.  Handle the logic branching (New vs Transfer).
    4.  Show success/failure snackbar.
    5.  **Definition of Done:**
        *   **Documentation:** Update User Guide with "How to Add Candidate".
        *   **Unit Tests:** Test form validation and Bloc state transitions for the Wizard.
        *   **Integration Tests:** Flow test: Fill form -> Mock API response -> Verify Next Step.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

---

## Phase 4: Financial Module

### Task 4.1: Backend - Finance Services
*   **Dependencies:** Task 1.2, Task 2.1.
*   **Acceptance Criteria:**
    *   `Transaction` and `DuesRecord` entities in DB.
    *   `RecordTransaction` saves to DB.
    *   `UpdateDuesStatus` updates DB.
*   **Description:**
    1.  Add `Transaction` and `DuesRecord` entities to `AppDbContext`.
    2.  Migrate DB.
    3.  Implement `FinanceService`.
    4.  `RecordTransaction`: Validate input, save.
    5.  `UpdateDuesStatus`: Find record, update status/payment date.
    6.  **Definition of Done:**
        *   **Documentation:** Document the Finance data model.
        *   **Unit Tests:** Test transaction recording and dues updating logic.
        *   **Integration Tests:** Verify `RecordTransaction` persists data to DB via gRPC.
        *   **Static Analysis:** Run `dotnet build` and ensure 0 warnings.

### Task 4.2: Frontend - Ledger & Dues
*   **Dependencies:** Task 4.1.
*   **Acceptance Criteria:**
    *   Ledger Screen lists transactions.
    *   Floating Action Button to "Add Voucher" (Income/Expense).
    *   Dues Screen lists members with payment status.
    *   "Mark Paid" toggle updates backend.
*   **Description:**
    1.  Create `FinanceRepository`.
    2.  Create `LedgerScreen` and `AddVoucherDialog`.
    3.  Create `DuesScreen` with list of members and `Switch` or `Checkbox` for payment status.
    4.  **Definition of Done:**
        *   **Documentation:** Document the Ledger and Dues UI features.
        *   **Unit Tests:** Test Finance Bloc and Repository.
        *   **Integration Tests:** Widget test for Ledger list and Dues toggle interactions.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

---

## Phase 5: Program Activities & Star Council Tracker

### Task 5.1: Backend - Program Activities & Star Council Logic
*   **Dependencies:** Task 2.1 (Membership Data Layer), Task 4.1 (Finance Services).
*   **Acceptance Criteria:**
    *   `ProgramActivity` entity added to DB using EF Core.
    *   gRPC service `ActivityService` implemented on the backend.
    *   `SubmitProgramActivity` records Form 10784 submissions and generates a Supreme Confirmation Number.
    *   `GetStarCouncilStatus` dynamically calculates status against quotas (Membership, Seminars, Faith/Family/Community/Life program count) and form submission checks.
*   **Description:**
    1.  Create `ProgramActivity` database model (ActivityId, CouncilId, Category, SubmitterNumber, VolunteerCount, Hours, MoneyDonated, MoneyRaised, Status, etc.).
    2.  Add model to `AppDbContext`, generate EF migration, and apply to database.
    3.  Create `Services/ActivityService.cs` inheriting from `ActivityServiceBase`.
    4.  Implement logic in `GetStarCouncilStatus` to aggregate council-specific numbers (membership intake growth, insurance seminar counts, submitted programs per category, compliance status).
    5.  **Definition of Done:**
        *   **Documentation:** Document the calculation rules for the Star Council Award in the code comments and database schema documentation.
        *   **Unit Tests:** Add unit tests for `ActivityService` verifying calculations for qualified vs non-qualified states.
        *   **Integration Tests:** Verify `SubmitProgramActivity` persists activity records.
        *   **Static Analysis:** Ensure C# build compiles with 0 warnings.

### Task 5.2: Frontend - Form 10784 Activity Wizard
*   **Dependencies:** Task 1.3 (gRPC Infrastructure), Task 5.1.
*   **Acceptance Criteria:**
    *   A wizard screen to input activity details (Name, Date, Category, Submitter, Volunteer Count, Hours, Monies).
    *   Input validation for mandatory fields.
    *   Calls gRPC `SubmitProgramActivity` on submit.
*   **Description:**
    1.  Create `lib/features/activities/presentation/screens/activity_form_screen.dart`.
    2.  Build the form inputs with Flutter Form widgets.
    3.  Implement `ActivityBloc` to handle state (Drafting, Submitting, Success, Error).
    4.  **Definition of Done:**
        *   **Documentation:** Add screenshots of the activity wizard to documentation.
        *   **Unit Tests:** Test validation logic and BLoC states.
        *   **Integration Tests:** Widget test ensuring form validation prevents submission with invalid fields.
        *   **Static Analysis:** Run `flutter analyze` with 0 warnings.

### Task 5.3: Frontend - Star Council Tracker Dashboard
*   **Dependencies:** Task 5.1, Task 2.2.
*   **Acceptance Criteria:**
    *   An interactive dashboard showing progress towards Star Council status.
    *   Visual progress indicators for McGivney, Founders', and Columbian awards.
    *   Checklists for required forms (185, 365, 1728) and Safe Environment status.
*   **Description:**
    1.  Create `lib/features/activities/presentation/screens/star_council_dashboard.dart`.
    2.  Build visual progress bars/graphs using custom painter or core widgets.
    3.  Implement `StarCouncilBloc` to fetch status and handle pull-to-refresh.
    4.  **Definition of Done:**
        *   **Documentation:** Document dashboard components.
        *   **Unit Tests:** Test `StarCouncilBloc` state emissions.
        *   **Integration Tests:** Widget test of progress rendering.
        *   **Static Analysis:** Run `flutter analyze` with 0 warnings.

---

## Phase 6: Offline Architecture & Synchronization

### Task 6.1: Frontend - Isar Integration (Extended)
*   **Dependencies:** Task 2.2, Task 4.2, Task 5.2.
*   **Acceptance Criteria:**
    *   `LocalProgramActivity` collection added to Isar.
    *   Form 10784 activities can be saved locally as drafts and read while offline.
*   **Description:**
    1.  Define Isar schema `LocalProgramActivity`.
    2.  Update `ActivityRepository` to load from Isar first, fall back or refresh from gRPC when online.
    3.  **Definition of Done:**
        *   **Documentation:** Document updated Isar schema mapping.
        *   **Unit Tests:** Test Isar read/write for local activity records.
        *   **Integration Tests:** Verify local CRUD operations on activities when offline.
        *   **Static Analysis:** Run `flutter analyze` with 0 warnings.

### Task 6.2: Frontend - Sync & Mutation Queue (Extended)
*   **Dependencies:** Task 6.1, Task 5.2.
*   **Acceptance Criteria:**
    *   Offline Form 10784 submissions are added to the local mutation queue.
    *   On network reconnection, mutation queue replays submissions to the backend.
*   **Description:**
    1.  Update the existing `MutationQueue` to support activity sync payloads.
    2.  Update `SyncService` to process pending activity mutations and replace temporary IDs with Supreme confirmation numbers.
    3.  **Definition of Done:**
        *   **Documentation:** Update sync sequence diagrams and explanation.
        *   **Unit Tests:** Test mutation queue serialization/deserialization for activities.
        *   **Integration Tests:** Mock network transition offline -> online and verify sync triggers.
        *   **Static Analysis:** Run `flutter analyze` with 0 warnings.

---

## Phase 7: Finalization & Polish

### Task 7.1: Documentation & Polish
*   **Dependencies:** All above.
*   **Acceptance Criteria:**
    *   Updated `README.md` and docs.
    *   Clean source code comments and zero linter warnings.
*   **Description:**
    1.  Review all feature flows (Membership, Finance, Activities, Tracker).
    2.  Update help guides and documentation screenshots.
    3.  Verify full test coverage.
    4.  **Definition of Done:**
        *   **Documentation:** Finalize documentation.
        *   **Unit Tests:** Ensure coverage > 80%.
        *   **Integration Tests:** Run full regression suite.
        *   **Static Analysis:** Zero compiler or linter warnings across the repository.
