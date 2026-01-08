//
//  Generated code. Do not modify.
//  source: finance.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'finance.pb.dart' as $0;

export 'finance.pb.dart';

@$pb.GrpcServiceName('kofc.finance.v1.FinanceService')
class FinanceServiceClient extends $grpc.Client {
  static final _$recordTransaction = $grpc.ClientMethod<$0.TransactionRequest, $0.TransactionResponse>(
      '/kofc.finance.v1.FinanceService/RecordTransaction',
      ($0.TransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransactionResponse.fromBuffer(value));
  static final _$updateDuesStatus = $grpc.ClientMethod<$0.DuesUpdateRequest, $0.DuesUpdateResponse>(
      '/kofc.finance.v1.FinanceService/UpdateDuesStatus',
      ($0.DuesUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DuesUpdateResponse.fromBuffer(value));

  FinanceServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.TransactionResponse> recordTransaction($0.TransactionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.DuesUpdateResponse> updateDuesStatus($0.DuesUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDuesStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('kofc.finance.v1.FinanceService')
abstract class FinanceServiceBase extends $grpc.Service {
  $core.String get $name => 'kofc.finance.v1.FinanceService';

  FinanceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TransactionRequest, $0.TransactionResponse>(
        'RecordTransaction',
        recordTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TransactionRequest.fromBuffer(value),
        ($0.TransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DuesUpdateRequest, $0.DuesUpdateResponse>(
        'UpdateDuesStatus',
        updateDuesStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DuesUpdateRequest.fromBuffer(value),
        ($0.DuesUpdateResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.TransactionResponse> recordTransaction_Pre($grpc.ServiceCall $call, $async.Future<$0.TransactionRequest> $request) async {
    return recordTransaction($call, await $request);
  }

  $async.Future<$0.DuesUpdateResponse> updateDuesStatus_Pre($grpc.ServiceCall $call, $async.Future<$0.DuesUpdateRequest> $request) async {
    return updateDuesStatus($call, await $request);
  }

  $async.Future<$0.TransactionResponse> recordTransaction($grpc.ServiceCall call, $0.TransactionRequest request);
  $async.Future<$0.DuesUpdateResponse> updateDuesStatus($grpc.ServiceCall call, $0.DuesUpdateRequest request);
}
