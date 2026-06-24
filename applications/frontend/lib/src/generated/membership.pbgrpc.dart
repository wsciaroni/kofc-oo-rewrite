//
//  Generated code. Do not modify.
//  source: membership.proto
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

import 'membership.pb.dart' as $2;

export 'membership.pb.dart';

@$pb.GrpcServiceName('kofc.membership.v1.MembershipService')
class MembershipServiceClient extends $grpc.Client {
  static final _$findCandidate = $grpc.ClientMethod<$2.FindCandidateRequest, $2.FindCandidateResponse>(
      '/kofc.membership.v1.MembershipService/FindCandidate',
      ($2.FindCandidateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.FindCandidateResponse.fromBuffer(value));
  static final _$processCandidate = $grpc.ClientMethod<$2.ProcessCandidateRequest, $2.CandidateResponse>(
      '/kofc.membership.v1.MembershipService/ProcessCandidate',
      ($2.ProcessCandidateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CandidateResponse.fromBuffer(value));
  static final _$getCouncilRoster = $grpc.ClientMethod<$2.RosterRequest, $2.MemberProfile>(
      '/kofc.membership.v1.MembershipService/GetCouncilRoster',
      ($2.RosterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.MemberProfile.fromBuffer(value));

  MembershipServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$2.FindCandidateResponse> findCandidate($2.FindCandidateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findCandidate, request, options: options);
  }

  $grpc.ResponseFuture<$2.CandidateResponse> processCandidate($2.ProcessCandidateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$processCandidate, request, options: options);
  }

  $grpc.ResponseStream<$2.MemberProfile> getCouncilRoster($2.RosterRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getCouncilRoster, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('kofc.membership.v1.MembershipService')
abstract class MembershipServiceBase extends $grpc.Service {
  $core.String get $name => 'kofc.membership.v1.MembershipService';

  MembershipServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.FindCandidateRequest, $2.FindCandidateResponse>(
        'FindCandidate',
        findCandidate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.FindCandidateRequest.fromBuffer(value),
        ($2.FindCandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ProcessCandidateRequest, $2.CandidateResponse>(
        'ProcessCandidate',
        processCandidate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ProcessCandidateRequest.fromBuffer(value),
        ($2.CandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RosterRequest, $2.MemberProfile>(
        'GetCouncilRoster',
        getCouncilRoster_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.RosterRequest.fromBuffer(value),
        ($2.MemberProfile value) => value.writeToBuffer()));
  }

  $async.Future<$2.FindCandidateResponse> findCandidate_Pre($grpc.ServiceCall $call, $async.Future<$2.FindCandidateRequest> $request) async {
    return findCandidate($call, await $request);
  }

  $async.Future<$2.CandidateResponse> processCandidate_Pre($grpc.ServiceCall $call, $async.Future<$2.ProcessCandidateRequest> $request) async {
    return processCandidate($call, await $request);
  }

  $async.Stream<$2.MemberProfile> getCouncilRoster_Pre($grpc.ServiceCall $call, $async.Future<$2.RosterRequest> $request) async* {
    yield* getCouncilRoster($call, await $request);
  }

  $async.Future<$2.FindCandidateResponse> findCandidate($grpc.ServiceCall call, $2.FindCandidateRequest request);
  $async.Future<$2.CandidateResponse> processCandidate($grpc.ServiceCall call, $2.ProcessCandidateRequest request);
  $async.Stream<$2.MemberProfile> getCouncilRoster($grpc.ServiceCall call, $2.RosterRequest request);
}
