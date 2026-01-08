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

import 'membership.pb.dart' as $1;

export 'membership.pb.dart';

@$pb.GrpcServiceName('kofc.membership.v1.MembershipService')
class MembershipServiceClient extends $grpc.Client {
  static final _$findCandidate = $grpc.ClientMethod<$1.FindCandidateRequest, $1.FindCandidateResponse>(
      '/kofc.membership.v1.MembershipService/FindCandidate',
      ($1.FindCandidateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.FindCandidateResponse.fromBuffer(value));
  static final _$processCandidate = $grpc.ClientMethod<$1.ProcessCandidateRequest, $1.CandidateResponse>(
      '/kofc.membership.v1.MembershipService/ProcessCandidate',
      ($1.ProcessCandidateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.CandidateResponse.fromBuffer(value));
  static final _$getCouncilRoster = $grpc.ClientMethod<$1.RosterRequest, $1.MemberProfile>(
      '/kofc.membership.v1.MembershipService/GetCouncilRoster',
      ($1.RosterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.MemberProfile.fromBuffer(value));

  MembershipServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.FindCandidateResponse> findCandidate($1.FindCandidateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findCandidate, request, options: options);
  }

  $grpc.ResponseFuture<$1.CandidateResponse> processCandidate($1.ProcessCandidateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$processCandidate, request, options: options);
  }

  $grpc.ResponseStream<$1.MemberProfile> getCouncilRoster($1.RosterRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getCouncilRoster, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('kofc.membership.v1.MembershipService')
abstract class MembershipServiceBase extends $grpc.Service {
  $core.String get $name => 'kofc.membership.v1.MembershipService';

  MembershipServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.FindCandidateRequest, $1.FindCandidateResponse>(
        'FindCandidate',
        findCandidate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FindCandidateRequest.fromBuffer(value),
        ($1.FindCandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ProcessCandidateRequest, $1.CandidateResponse>(
        'ProcessCandidate',
        processCandidate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ProcessCandidateRequest.fromBuffer(value),
        ($1.CandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RosterRequest, $1.MemberProfile>(
        'GetCouncilRoster',
        getCouncilRoster_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.RosterRequest.fromBuffer(value),
        ($1.MemberProfile value) => value.writeToBuffer()));
  }

  $async.Future<$1.FindCandidateResponse> findCandidate_Pre($grpc.ServiceCall $call, $async.Future<$1.FindCandidateRequest> $request) async {
    return findCandidate($call, await $request);
  }

  $async.Future<$1.CandidateResponse> processCandidate_Pre($grpc.ServiceCall $call, $async.Future<$1.ProcessCandidateRequest> $request) async {
    return processCandidate($call, await $request);
  }

  $async.Stream<$1.MemberProfile> getCouncilRoster_Pre($grpc.ServiceCall $call, $async.Future<$1.RosterRequest> $request) async* {
    yield* getCouncilRoster($call, await $request);
  }

  $async.Future<$1.FindCandidateResponse> findCandidate($grpc.ServiceCall call, $1.FindCandidateRequest request);
  $async.Future<$1.CandidateResponse> processCandidate($grpc.ServiceCall call, $1.ProcessCandidateRequest request);
  $async.Stream<$1.MemberProfile> getCouncilRoster($grpc.ServiceCall call, $1.RosterRequest request);
}
