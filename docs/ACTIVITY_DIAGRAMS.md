# Activity Diagrams

This document details the complex workflows and logic paths within the **Officers Online** application.

## 1. Candidate Intake Workflow

This diagram details the decision logic for processing a new candidate, differentiating between new members and transfers.

```plantuml
@startuml
start

:FS enters Candidate Name & DOB;
:App calls FindCandidate();

if (Member Exists in Supreme DB?) then (Yes)
  :Display "Existing Member Found";
  :Show Current Council ID;

  if (Member in Current Council?) then (Yes)
    :Show Error: "Already a Member";
    stop
  else (No)
    :Prompt for Transfer;
    if (FS Confirms Transfer?) then (Yes)
      :Enter "Process Date" (Vote Date);
      :Enter "Readmission Date" (if applicable);
      :Submit Transfer Request;
      :System Notifies Old Council;
      :Update Local Roster;
    else (No)
      stop
    endif
  endif

else (No)
  :Display "New Candidate Form";
  :Enter Address, Email, Phone;
  :Enter "Process Date" (Vote Date);
  :Enter "First Degree Date";

  if (Data Valid?) then (Yes)
    :Submit New Member Request;
    :System Generates Member Number;
    :Update Local Roster;
  else (No)
    :Show Validation Errors;
    stop
  endif
endif

:Display Success Message;
:Offer to Email Welcome Packet;

stop
@enduml
```

## 2. Semi-Annual Audit Workflow

The process of generating the required semi-annual financial audit report.

```plantuml
@startuml
|Financial Secretary|
start
:Select "Generate Audit Report";
:Choose Period (Jan-Jun or Jul-Dec);

|System|
:Fetch all Ledger Transactions for Period;
:Separate Income and Expenses;
:Calculate Totals per Category;

if (Unreconciled Transactions Exist?) then (Yes)
  :Flag Warning;
  |Financial Secretary|
  :Review Unreconciled Items;
  if (Resolve Now?) then (Yes)
    :Mark Reconciled;
  else (No)
    :Proceed with Warning;
  endif
else (No)
endif

|System|
:Fetch Bank Balance (Start & End);
:Compare Calculated Ledger Balance vs Bank Balance;

if (Balances Match?) then (Yes)
  :Generate PDF Draft;
else (No)
  :Show Discrepancy Amount;
  :Generate "Draft with Errors";
endif

|Financial Secretary|
:Review Draft PDF;
:Digitally Sign (FS);

|Grand Knight|
:Receive Notification;
:Review Audit Report;
:Digitally Sign (GK);

|Trustees (3)|
:Receive Notification;
fork
  :Trustee 1 Signs;
fork again
  :Trustee 2 Signs;
fork again
  :Trustee 3 Signs;
end fork

|System|
:Finalize PDF;
:Submit to Supreme Council;
:Archive in Council Records;

stop
@enduml
```
