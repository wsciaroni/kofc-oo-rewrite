import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import '../../core/network/grpc_client_provider.dart';
import '../generated/finance.pbgrpc.dart';
import '../generated/google/type/money.pb.dart';

// --- EVENTS ---
abstract class FinanceEvent extends Equatable {
  const FinanceEvent();

  @override
  List<Object?> get props => [];
}

class RecordTransactionEvent extends FinanceEvent {
  final int councilId;
  final TransactionType type;
  final double amount;
  final String description;
  final String? checkNumber;
  final int? linkedMemberId;

  const RecordTransactionEvent({
    required this.councilId,
    required this.type,
    required this.amount,
    required this.description,
    this.checkNumber,
    this.linkedMemberId,
  });

  @override
  List<Object?> get props => [councilId, type, amount, description, checkNumber, linkedMemberId];
}

class UpdateDuesStatusEvent extends FinanceEvent {
  final int memberId;
  final bool isPaid;
  final int councilId;

  const UpdateDuesStatusEvent({
    required this.memberId,
    required this.isPaid,
    required this.councilId,
  });

  @override
  List<Object?> get props => [memberId, isPaid, councilId];
}

// --- STATES ---
abstract class FinanceState extends Equatable {
  const FinanceState();

  @override
  List<Object?> get props => [];
}

class FinanceInitial extends FinanceState {}

class FinanceActionLoading extends FinanceState {}

class TransactionSuccess extends FinanceState {
  final String transactionId;
  final TransactionType type;
  final double amount;
  final String description;
  const TransactionSuccess({
    required this.transactionId,
    required this.type,
    required this.amount,
    required this.description,
  });

  @override
  List<Object?> get props => [transactionId, type, amount, description];
}

class DuesUpdateSuccess extends FinanceState {
  final int memberId;
  final bool isPaid;
  const DuesUpdateSuccess({required this.memberId, required this.isPaid});

  @override
  List<Object?> get props => [memberId, isPaid];
}

class FinanceError extends FinanceState {
  final String message;
  const FinanceError(this.message);

  @override
  List<Object?> get props => [message];
}

// --- BLOC ---
class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final _client = GrpcClientProvider().financeClient;

  FinanceBloc() : super(FinanceInitial()) {
    on<RecordTransactionEvent>((event, emit) async {
      emit(FinanceActionLoading());
      try {
        final units = event.amount.truncate();
        final nanos = ((event.amount - units) * 1000000000).round();

        final money = Money()
          ..currencyCode = 'USD'
          ..units = Int64(units)
          ..nanos = nanos;

        final request = TransactionRequest()
          ..councilId = event.councilId
          ..type = event.type
          ..amount = money
          ..description = event.description;

        if (event.checkNumber != null) {
          request.checkNumber = event.checkNumber!;
        }
        if (event.linkedMemberId != null) {
          request.linkedMemberId = event.linkedMemberId!;
        }

        final response = await _client.recordTransaction(request);
        if (response.success) {
          emit(TransactionSuccess(
            transactionId: response.transactionId,
            type: event.type,
            amount: event.amount,
            description: event.description,
          ));
        } else {
          emit(const FinanceError('Failed to record transaction.'));
        }
      } catch (e) {
        emit(FinanceError(e.toString()));
      }
    });

    on<UpdateDuesStatusEvent>((event, emit) async {
      emit(FinanceActionLoading());
      try {
        final request = DuesUpdateRequest()
          ..memberId = event.memberId
          ..isPaid = event.isPaid;

        final response = await _client.updateDuesStatus(request);
        if (response.success) {
          emit(DuesUpdateSuccess(memberId: event.memberId, isPaid: event.isPaid));
        } else {
          emit(const FinanceError('Failed to update dues status.'));
        }
      } catch (e) {
        emit(FinanceError(e.toString()));
      }
    });
  }
}
