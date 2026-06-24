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

## 3. Form 10784 Program Activity Submission

This diagram details the flow when an officer or director submits a new program activity, handling offline capability.

```plantuml
@startuml
start

:User opens "New Program Activity Form";
:Enter Activity Name, Category, Date, Volunteer Count, Hours, Monies;
:Validate Inputs;

if (Inputs Valid?) then (No)
  :Display Validation Errors;
  stop
else (Yes)
  if (App Online?) then (No)
    :Save Activity to Isar (Status: DRAFT);
    :Queue Submit Activity Mutation in Log;
    :Show Status: "Saved Offline (Pending Sync)";
    stop
  else (Yes)
    :Call backend SubmitProgramActivity();
    :Backend persists in local DB;
    :Backend Mock Syncs with Supreme DB;
    :Generate Supreme Confirmation Number;
    :Return Success response with Confirmation Number;
    :Save to Isar (Status: SUBMITTED);
    :Show Status: "Submitted to Supreme";
  endif
endif

stop
@enduml
```

## 4. Star Council Status Calculation

How the backend aggregates data to calculate progress toward the Star Council Award.

```plantuml
@startuml
start

:Request GetStarCouncilStatus();
:Backend queries active Fraternal Year parameters;

fork
  :Fetch Membership Growth;
  :Calculate Net Growth;
  if (Net Growth >= Membership Quota?) then (Yes)
    :Mark Father McGivney qualified;
  else (No)
    :Mark Father McGivney incomplete;
  endif
fork again
  :Fetch Submitted Form 11077 (Insurance Seminars);
  if (Seminars Count >= 2?) then (Yes)
    :Mark Founders' qualified;
  else (No)
    :Mark Founders' incomplete;
  endif
fork again
  :Fetch Form 10784 (Program Activities) for Council;
  :Group by Category (Faith, Family, Community, Life);
  if (All categories have >= 4 activities?) then (Yes)
    :Mark Columbian qualified;
  else (No)
    :Mark Columbian incomplete;
  endif
fork again
  :Query required form submissions (185, 365, 1728);
  :Check compliance dates;
fork again
  :Check Safe Environment compliance status;
  :Verify GK, FS, Family and Community Directors;
end fork

:Compile GetStarCouncilStatusResponse;
if (McGivney, Founders', Columbian, Forms & Safe Environment all qualified?) then (Yes)
  :Set star_council_qualified = true;
else (No)
  :Set star_council_qualified = false;
endif

:Return Response to Frontend;
:Frontend displays Tracker Dashboard;
:Render progress bars & visual status indicators;

stop
@enduml
```

