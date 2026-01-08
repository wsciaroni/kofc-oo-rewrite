# Sequence Diagrams

This document details the interaction flows for key scenarios in the **Officers Online** application.

## 1. Candidate Intake & Transfer ("The Pull")

This scenario illustrates the workflow when the Financial Secretary enters a new candidate. The system checks the Supreme Database to determine if it is a new member or a transfer from another council.

```plantuml
@startuml
actor "Financial Secretary" as FS
participant "Mobile App" as App
participant "Local DB (Isar)" as LocalDB
participant "Backend Service" as Backend
participant "Supreme Database" as Supreme

FS -> App : Enter Candidate Info\n(Name, DOB)
activate App

App -> Backend : FindCandidate(Name, DOB)
activate Backend

Backend -> Supreme : Query Member
activate Supreme
Supreme --> Backend : Search Results
deactivate Supreme

alt Candidate Not Found
    Backend --> App : Status: NEW_CANDIDATE
    App -> FS : Show "New Candidate" Form
    FS -> App : Enter Process & Ceremonial Dates
    App -> Backend : ProcessCandidate(New)
    Backend -> Supreme : Create Record
    Backend --> App : Success (MemberID)
    App -> LocalDB : Save New Member
    App --> FS : Confirmation

else Candidate Found (Existing Member)
    Backend --> App : Status: EXISTING (Council ID, MemberID)
    App -> FS : Display "Member Found in Council X"
    FS -> App : Confirm "Transfer"
    App -> FS : Request "Process Date" (Vote)
    FS -> App : Enter Date
    App -> Backend : ProcessCandidate(Transfer)
    Backend -> Supreme : Initiate Transfer
    Backend -> Supreme : Notify Old Council
    Backend --> App : Success (Transfer Complete)
    App -> LocalDB : Save Member (Transferred)
    App --> FS : Confirmation
end

deactivate Backend
deactivate App
@enduml
```

## 2. Dues Assessment & Payment

This scenario shows the process of billing members for dues and subsequently receiving a payment.

```plantuml
@startuml
actor "Financial Secretary" as FS
participant "Mobile App" as App
participant "Local DB (Isar)" as LocalDB
participant "Backend Service" as Backend

== Phase 1: Assess Dues ==

FS -> App : Select "Assess Dues"
activate App
App -> App : Filter "Billable" Members
App -> FS : Confirm Batch (Count: 150, Amount: $30)
FS -> App : Execute Assessment

group Batch Transaction
    App -> LocalDB : Create Dues Records (Unpaid)
    App -> LocalDB : Log "Dues Assessment" Transaction
end

App -> Backend : Sync Dues Records (Background)
App --> FS : Success Message
deactivate App

== Phase 2: Receive Payment ==

FS -> App : Select Member (John Doe)
activate App
App -> App : Display Outstanding Balance ($30)
FS -> App : Click "Receive Payment"
FS -> App : Enter Amount ($30), Type (Check #123)
App -> LocalDB : Update Dues Record (Status: Paid)
App -> LocalDB : Create Income Transaction
App -> Backend : UpdateDuesStatus(MemberID, Paid)
activate Backend
Backend --> App : Ack
deactivate Backend

App -> App : Generate Digital Receipt
App --> FS : Show Receipt / Email Option
deactivate App
@enduml
```

## 3. Offline Synchronization

This illustrates the "Offline-First" architecture where actions taken while offline are queued and synced when connectivity is restored.

```plantuml
@startuml
actor User
participant "Mobile App" as App
participant "Local DB (Isar)" as LocalDB
participant "Mutation Log" as Log
participant "Backend Service" as Backend

== Online Mode (Initial Sync) ==
App -> Backend : GetCouncilRoster()
activate Backend
Backend --> App : Stream<MemberProfile>
deactivate Backend
App -> LocalDB : Cache Data

== Offline Mode ==
User -> App : Add New Candidate (John Smith)
activate App
App -> App : Check Connectivity (Offline)
App -> LocalDB : Save Candidate (Temp ID)
App -> Log : Add Entry: {Action: PROCESS_CANDIDATE, Data: ...}
App --> User : Saved (Offline Icon)
deactivate App

== Connectivity Restored ==
App -> App : Detect Internet Connection
activate App
App -> Log : Read Pending Mutations

loop For Each Mutation
    App -> Backend : Execute Mutation (gRPC)
    activate Backend
    Backend --> App : Success / New Real ID
    deactivate Backend
    App -> Log : Mark Processed
    App -> LocalDB : Update Record (Replace Temp ID)
end

App --> User : "Sync Complete" Notification
deactivate App
@enduml
```
