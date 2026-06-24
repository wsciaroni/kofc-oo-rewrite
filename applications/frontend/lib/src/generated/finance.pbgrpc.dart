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

import 'finance.pb.dart' as $1;

export 'finance.pb.dart';

@$pb.GrpcServiceName('kofc.finance.v1.FinanceService')
class FinanceServiceClient extends $grpc.Client {
  static final _$recordTransaction = $grpc.ClientMethod<$1.TransactionRequest, $1.TransactionResponse>(
      '/kofc.finance.v1.FinanceService/RecordTransaction',
      ($1.TransactionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.TransactionResponse.fromBuffer(value));
  static final _$updateDuesStatus = $grpc.ClientMethod<$1.DuesUpdateRequest, $1.DuesUpdateResponse>(
      '/kofc.finance.v1.FinanceService/UpdateDuesStatus',
      ($1.DuesUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.DuesUpdateResponse.fromBuffer(value));

  FinanceServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.TransactionResponse> recordTransaction($1.TransactionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$1.DuesUpdateResponse> updateDuesStatus($1.DuesUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDuesStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('kofc.finance.v1.FinanceService')
abstract class FinanceServiceBase extends $grpc.Service {
  $core.String get $name => 'kofc.finance.v1.FinanceService';

  FinanceServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.TransactionRequest, $1.TransactionResponse>(
        'RecordTransaction',
        recordTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.TransactionRequest.fromBuffer(value),
        ($1.TransactionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DuesUpdateRequest, $1.DuesUpdateResponse>(
        'UpdateDuesStatus',
        updateDuesStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DuesUpdateRequest.fromBuffer(value),
        ($1.DuesUpdateResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.TransactionResponse> recordTransaction_Pre($grpc.ServiceCall $call, $async.Future<$1.TransactionRequest> $request) async {
    return recordTransaction($call, await $request);
  }

  $async.Future<$1.DuesUpdateResponse> updateDuesStatus_Pre($grpc.ServiceCall $call, $async.Future<$1.DuesUpdateRequest> $request) async {
    return updateDuesStatus($call, await $request);
  }

  $async.Future<$1.TransactionResponse> recordTransaction($grpc.ServiceCall call, $1.TransactionRequest request);
  $async.Future<$1.DuesUpdateResponse> updateDuesStatus($grpc.ServiceCall call, $1.DuesUpdateRequest request);
}
