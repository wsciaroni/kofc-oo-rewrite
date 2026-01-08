# Use Case Model

This document outlines the actors and use cases for the **Officers Online (Next Gen)** application.

## Actors

*   **Financial Secretary (FS):** Primary Administrator. Has full access to Membership and Financial modules.
*   **Grand Knight (GK):** Council Leader. Focuses on compliance, reports, and officer assignments.
*   **Delegate:** A standard member with granular permissions (e.g., Scribe, Treasurer).
*   **District/State Officer:** Read-only access to multiple councils.
*   **Member:** A general member of the council (limited access).
*   **System (Supreme DB):** The external Knights of Columbus central database.

## Use Case Diagram

```plantuml
@startuml
left to right direction
skinparam packageStyle rectangle

actor "Financial Secretary" as FS
actor "Grand Knight" as GK
actor "Delegate" as Delegate
actor "District/State Officer" as DO
actor "Member" as Member
actor "Supreme Database" as Supreme

package "Officers Online App" {

  package "Membership Management" {
    usecase "Candidate Intake (New)" as UC_Intake
    usecase "Process Transfer (Pull)" as UC_Transfer
    usecase "Manage Prospect List" as UC_Prospect
    usecase "View Roster" as UC_Roster
    usecase "Update Member Photo" as UC_Photo
    usecase "View Digital Card" as UC_Card
  }

  package "Financial Module" {
    usecase "Assess Dues (Batch)" as UC_Assess
    usecase "Receive Payment" as UC_Payment
    usecase "Record Income Voucher" as UC_Income
    usecase "Record Expense Voucher" as UC_Expense
    usecase "Generate Audit Report" as UC_Audit
  }

  package "Administration" {
    usecase "Manage Officers" as UC_Officers
    usecase "View Safe Environment Status" as UC_SafeEnv
    usecase "Configure Fraternal Year" as UC_Year
  }

  package "Communication" {
    usecase "Send Bulk Email" as UC_Email
    usecase "Schedule Email" as UC_Schedule
  }
}

' Relationships

' FS Relationships
FS --> UC_Intake
FS --> UC_Transfer
FS --> UC_Prospect
FS --> UC_Roster
FS --> UC_Photo
FS --> UC_Assess
FS --> UC_Payment
FS --> UC_Income
FS --> UC_Expense
FS --> UC_Audit
FS --> UC_Officers
FS --> UC_SafeEnv
FS --> UC_Email
FS --> UC_Schedule

' GK Relationships
GK --> UC_Roster
GK --> UC_Audit
GK --> UC_SafeEnv
GK --> UC_Officers
GK --> UC_Email

' Delegate Relationships (Granular)
Delegate --> UC_Roster
' Note: Specific permissions would enable other UCs

' District Officer Relationships
DO --> UC_Roster
DO --> UC_Audit : (Read Only)
DO --> UC_SafeEnv : (Read Only)

' Member Relationships
Member --> UC_Card : (View Own)

' System Interactions
UC_Intake .> Supreme : <<verify>>
UC_Transfer .> Supreme : <<sync>>

@enduml
```

## Use Case Descriptions

### Membership Management

*   **Candidate Intake (New):** FS enters details for a new Knight. System creates a new record if not found in Supreme.
*   **Process Transfer (Pull):** If a candidate exists in another council, the system initiates a transfer request.
*   **View Digital Card:** Displays the member's standing, degree, and dues status. Available to the Member (for themselves) and Officers (for verification).

### Financial Module

*   **Assess Dues:** Batch process to apply annual dues to billable members.
*   **Receive Payment:** Recording a member's dues payment (Cash/Check/Card) and generating a receipt.
*   **Council Ledger:** Recording general income and expenses for the council (e.g., Hall Rental, Pancake Breakfast).

### Administration & Communication

*   **Manage Officers:** Assigning roles for the current or next fraternal year.
*   **Safe Environment:** Dashboard to monitor officer compliance with background checks.
*   **Bulk Email:** Sending communications to filtered lists of members.
