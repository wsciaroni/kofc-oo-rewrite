import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/network/grpc_client_provider.dart';
import '../generated/membership.pbgrpc.dart';
import '../generated/google/protobuf/timestamp.pb.dart';

// --- EVENTS ---
abstract class MembershipEvent extends Equatable {
  const MembershipEvent();

  @override
  List<Object?> get props => [];
}

class LoadRosterEvent extends MembershipEvent {
  final int councilId;
  const LoadRosterEvent(this.councilId);

  @override
  List<Object?> get props => [councilId];
}

class FindCandidateEvent extends MembershipEvent {
  final String firstName;
  final String lastName;
  final DateTime dob;
  const FindCandidateEvent({required this.firstName, required this.lastName, required this.dob});

  @override
  List<Object?> get props => [firstName, lastName, dob];
}

class ProcessCandidateEvent extends MembershipEvent {
  final int targetCouncilId;
  final String firstName;
  final String lastName;
  final DateTime ceremonialDate;
  const ProcessCandidateEvent({
    required this.targetCouncilId,
    required this.firstName,
    required this.lastName,
    required this.ceremonialDate,
  });

  @override
  List<Object?> get props => [targetCouncilId, firstName, lastName, ceremonialDate];
}

class ResetSearchEvent extends MembershipEvent {}

// --- STATES ---
abstract class MembershipState extends Equatable {
  const MembershipState();

  @override
  List<Object?> get props => [];
}

class MembershipInitial extends MembershipState {}

// Roster
class RosterLoading extends MembershipState {}

class RosterLoaded extends MembershipState {
  final List<MemberProfile> roster;
  const RosterLoaded(this.roster);

  @override
  List<Object?> get props => [roster];
}

class RosterError extends MembershipState {
  final String message;
  const RosterError(this.message);

  @override
  List<Object?> get props => [message];
}

// Find Candidate
class FindCandidateLoading extends MembershipState {}

class FindCandidateSuccess extends MembershipState {
  final bool exists;
  final int existingCouncilId;
  final String memberNumber;
  final String firstName;
  final String lastName;
  final DateTime dob;

  const FindCandidateSuccess({
    required this.exists,
    required this.existingCouncilId,
    required this.memberNumber,
    required this.firstName,
    required this.lastName,
    required this.dob,
  });

  @override
  List<Object?> get props => [exists, existingCouncilId, memberNumber, firstName, lastName, dob];
}

class FindCandidateError extends MembershipState {
  final String message;
  const FindCandidateError(this.message);

  @override
  List<Object?> get props => [message];
}

// Intake/Process Candidate
class ProcessCandidateLoading extends MembershipState {}

class ProcessCandidateSuccess extends MembershipState {
  final String message;
  final String memberId;
  const ProcessCandidateSuccess({required this.message, required this.memberId});

  @override
  List<Object?> get props => [message, memberId];
}

class ProcessCandidateError extends MembershipState {
  final String message;
  const ProcessCandidateError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- BLOC ---
class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final _client = GrpcClientProvider().membershipClient;

  MembershipBloc() : super(MembershipInitial()) {
    on<LoadRosterEvent>((event, emit) async {
      emit(RosterLoading());
      try {
        final request = RosterRequest()..councilId = event.councilId;
        final List<MemberProfile> roster = [];
        await for (var member in _client.getCouncilRoster(request)) {
          roster.add(member);
        }
        emit(RosterLoaded(roster));
      } catch (e) {
        emit(RosterError(e.toString()));
      }
    });

    on<FindCandidateEvent>((event, emit) async {
      emit(FindCandidateLoading());
      try {
        final timestamp = Timestamp.fromDateTime(event.dob.toUtc());
        final request = FindCandidateRequest()
          ..firstName = event.firstName
          ..lastName = event.lastName
          ..dateOfBirth = timestamp;

        final response = await _client.findCandidate(request);
        emit(FindCandidateSuccess(
          exists: response.exists,
          existingCouncilId: response.existingCouncilId,
          memberNumber: response.memberNumber,
          firstName: event.firstName,
          lastName: event.lastName,
          dob: event.dob,
        ));
      } catch (e) {
        emit(FindCandidateError(e.toString()));
      }
    });

    on<ProcessCandidateEvent>((event, emit) async {
      emit(ProcessCandidateLoading());
      try {
        final timestamp = Timestamp.fromDateTime(event.ceremonialDate.toUtc());
        final request = ProcessCandidateRequest()
          ..targetCouncilId = event.targetCouncilId
          ..firstName = event.firstName
          ..lastName = event.lastName
          ..ceremonialDate = timestamp
          ..processDate = Timestamp.fromDateTime(DateTime.now().toUtc());

        final response = await _client.processCandidate(request);
        if (response.success) {
          emit(ProcessCandidateSuccess(
            message: response.message,
            memberId: response.memberId,
          ));
        } else {
          emit(ProcessCandidateError(response.message));
        }
      } catch (e) {
        emit(ProcessCandidateError(e.toString()));
      }
    });

    on<ResetSearchEvent>((event, emit) {
      emit(MembershipInitial());
    });
  }
}
