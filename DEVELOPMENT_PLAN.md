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

## Phase 5: Offline Architecture

### Task 5.1: Frontend - Isar Integration
*   **Dependencies:** Task 2.2, Task 4.2.
*   **Acceptance Criteria:**
    *   `isar` package installed.
    *   Isar Collections defined (`LocalMember`, `LocalTransaction`).
    *   App works offline (reads from Isar).
*   **Description:**
    1.  Add `isar`, `isar_flutter_libs` to pubspec.
    2.  Define Isar schemas mirroring Proto definitions.
    3.  Update Repositories to:
        *   Read from Isar first.
        *   If online, fetch from gRPC, save to Isar, return fresh data.
        *   If offline, return Isar data.
    4.  **Definition of Done:**
        *   **Documentation:** Document the Offline-First strategy and Isar schema.
        *   **Unit Tests:** Test Isar read/write operations and Repository fallback logic.
        *   **Integration Tests:** Simulate offline mode and verify app still loads data.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

### Task 5.2: Frontend - Sync & Mutation Queue
*   **Dependencies:** Task 5.1.
*   **Acceptance Criteria:**
    *   Offline actions (Add Member, Mark Paid) are queued.
    *   When connectivity restores, queue is processed.
*   **Description:**
    1.  Create `MutationQueue` in Isar (storing ActionType + Payload).
    2.  Create `SyncService` that monitors connectivity.
    3.  On connect: Iterate Queue -> Call gRPC -> Delete from Queue.
    4.  **Definition of Done:**
        *   **Documentation:** Document the Sync/Mutation logic.
        *   **Unit Tests:** Test Queue addition and processing logic.
        *   **Integration Tests:** Test the full cycle: Offline Action -> Reconnect -> Sync.
        *   **Static Analysis:** Run `flutter analyze` and ensure 0 warnings.

---

## Phase 6: Finalization

### Task 6.1: Documentation & Polish
*   **Dependencies:** All above.
*   **Acceptance Criteria:**
    *   Updated `README.md` with screenshots.
    *   All Code comments are clear.
*   **Description:**
    1.  Review all features.
    2.  Generate final screenshots.
    3.  Ensure `AGENTS.md` is updated with any new conventions.
    4.  **Definition of Done:**
        *   **Documentation:** Finalize all project documentation (`README.md`, `AGENTS.md`).
        *   **Unit Tests:** Ensure overall project coverage > 80%.
        *   **Integration Tests:** Run full regression suite.
        *   **Static Analysis:** Zero warnings across the entire codebase.
