import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import '../../core/network/grpc_client_provider.dart';
import '../generated/activity.pbgrpc.dart';
import '../generated/google/protobuf/timestamp.pb.dart';
import '../generated/google/type/money.pb.dart';

// --- EVENTS ---
abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object?> get props => [];
}

class LoadStarCouncilStatusEvent extends ActivityEvent {
  final int councilId;
  final int fraternalYear;

  const LoadStarCouncilStatusEvent({required this.councilId, required this.fraternalYear});

  @override
  List<Object?> get props => [councilId, fraternalYear];
}

class LoadActivitiesEvent extends ActivityEvent {
  final int councilId;
  final int fraternalYear;

  const LoadActivitiesEvent({required this.councilId, required this.fraternalYear});

  @override
  List<Object?> get props => [councilId, fraternalYear];
}

class SubmitActivityEvent extends ActivityEvent {
  final String activityId;
  final int councilId;
  final String submitterMemberNumber;
  final ProgramCategory category;
  final String activityName;
  final DateTime eventDate;
  final int volunteerCount;
  final int volunteerHours;
  final double moneyDonated;
  final double moneyRaised;
  final String description;

  const SubmitActivityEvent({
    required this.activityId,
    required this.councilId,
    required this.submitterMemberNumber,
    required this.category,
    required this.activityName,
    required this.eventDate,
    required this.volunteerCount,
    required this.volunteerHours,
    required this.moneyDonated,
    required this.moneyRaised,
    required this.description,
  });

  @override
  List<Object?> get props => [
        activityId,
        councilId,
        submitterMemberNumber,
        category,
        activityName,
        eventDate,
        volunteerCount,
        volunteerHours,
        moneyDonated,
        moneyRaised,
        description,
      ];
}

// --- STATES ---
abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object?> get props => [];
}

class ActivityInitial extends ActivityState {}

// Star Council Status
class StarCouncilStatusLoading extends ActivityState {}

class StarCouncilStatusLoaded extends ActivityState {
  final GetStarCouncilStatusResponse status;
  const StarCouncilStatusLoaded(this.status);

  @override
  List<Object?> get props => [status];
}

class StarCouncilStatusError extends ActivityState {
  final String message;
  const StarCouncilStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

// Activities List
class ActivitiesLoading extends ActivityState {}

class ActivitiesLoaded extends ActivityState {
  final List<ProgramActivityProfile> activities;
  const ActivitiesLoaded(this.activities);

  @override
  List<Object?> get props => [activities];
}

class ActivitiesError extends ActivityState {
  final String message;
  const ActivitiesError(this.message);

  @override
  List<Object?> get props => [message];
}

// Submit Form 10784
class SubmitActivityLoading extends ActivityState {}

class SubmitActivitySuccess extends ActivityState {
  final String confirmationNumber;
  final String message;
  const SubmitActivitySuccess({required this.confirmationNumber, required this.message});

  @override
  List<Object?> get props => [confirmationNumber, message];
}

class SubmitActivityError extends ActivityState {
  final String message;
  const SubmitActivityError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- BLOC ---
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final _client = GrpcClientProvider().activityClient;

  ActivityBloc() : super(ActivityInitial()) {
    on<LoadStarCouncilStatusEvent>((event, emit) async {
      emit(StarCouncilStatusLoading());
      try {
        final request = GetStarCouncilStatusRequest()
          ..councilId = event.councilId
          ..fraternalYear = event.fraternalYear;

        final response = await _client.getStarCouncilStatus(request);
        emit(StarCouncilStatusLoaded(response));
      } catch (e) {
        emit(StarCouncilStatusError(e.toString()));
      }
    });

    on<LoadActivitiesEvent>((event, emit) async {
      emit(ActivitiesLoading());
      try {
        final request = GetProgramActivitiesRequest()
          ..councilId = event.councilId
          ..fraternalYear = event.fraternalYear;

        final List<ProgramActivityProfile> list = [];
        await for (var act in _client.getProgramActivities(request)) {
          list.add(act);
        }
        // Sort by event date descending
        list.sort((a, b) => b.eventDate.toDateTime().compareTo(a.eventDate.toDateTime()));
        emit(ActivitiesLoaded(list));
      } catch (e) {
        emit(ActivitiesError(e.toString()));
      }
    });

    on<SubmitActivityEvent>((event, emit) async {
      emit(SubmitActivityLoading());
      try {
        final donatedUnits = event.moneyDonated.truncate();
        final donatedNanos = ((event.moneyDonated - donatedUnits) * 1000000000).round();
        final donated = Money()
          ..currencyCode = 'USD'
          ..units = Int64(donatedUnits)
          ..nanos = donatedNanos;

        final raisedUnits = event.moneyRaised.truncate();
        final raisedNanos = ((event.moneyRaised - raisedUnits) * 1000000000).round();
        final raised = Money()
          ..currencyCode = 'USD'
          ..units = Int64(raisedUnits)
          ..nanos = raisedNanos;

        final request = SubmitProgramActivityRequest()
          ..activityId = event.activityId
          ..councilId = event.councilId
          ..submitterMemberNumber = event.submitterMemberNumber
          ..category = event.category
          ..activityName = event.activityName
          ..eventDate = Timestamp.fromDateTime(event.eventDate.toUtc())
          ..volunteerCount = event.volunteerCount
          ..volunteerHours = event.volunteerHours
          ..moneyDonated = donated
          ..moneyRaised = raised
          ..description = event.description
          ..status = FormStatus.FORM_STATUS_SUBMITTED;

        final response = await _client.submitProgramActivity(request);
        if (response.success) {
          emit(SubmitActivitySuccess(
            confirmationNumber: response.supremeConfirmationNumber,
            message: response.message,
          ));
        } else {
          emit(SubmitActivityError(response.message));
        }
      } catch (e) {
        emit(SubmitActivityError(e.toString()));
      }
    });
  }
}
