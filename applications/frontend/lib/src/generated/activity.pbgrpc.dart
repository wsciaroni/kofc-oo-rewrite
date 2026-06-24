//
//  Generated code. Do not modify.
//  source: activity.proto
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

import 'activity.pb.dart' as $0;

export 'activity.pb.dart';

@$pb.GrpcServiceName('kofc.activity.v1.ActivityService')
class ActivityServiceClient extends $grpc.Client {
  static final _$submitProgramActivity = $grpc.ClientMethod<$0.SubmitProgramActivityRequest, $0.SubmitProgramActivityResponse>(
      '/kofc.activity.v1.ActivityService/SubmitProgramActivity',
      ($0.SubmitProgramActivityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SubmitProgramActivityResponse.fromBuffer(value));
  static final _$getProgramActivities = $grpc.ClientMethod<$0.GetProgramActivitiesRequest, $0.ProgramActivityProfile>(
      '/kofc.activity.v1.ActivityService/GetProgramActivities',
      ($0.GetProgramActivitiesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProgramActivityProfile.fromBuffer(value));
  static final _$getStarCouncilStatus = $grpc.ClientMethod<$0.GetStarCouncilStatusRequest, $0.GetStarCouncilStatusResponse>(
      '/kofc.activity.v1.ActivityService/GetStarCouncilStatus',
      ($0.GetStarCouncilStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStarCouncilStatusResponse.fromBuffer(value));

  ActivityServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SubmitProgramActivityResponse> submitProgramActivity($0.SubmitProgramActivityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitProgramActivity, request, options: options);
  }

  $grpc.ResponseStream<$0.ProgramActivityProfile> getProgramActivities($0.GetProgramActivitiesRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getProgramActivities, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.GetStarCouncilStatusResponse> getStarCouncilStatus($0.GetStarCouncilStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStarCouncilStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('kofc.activity.v1.ActivityService')
abstract class ActivityServiceBase extends $grpc.Service {
  $core.String get $name => 'kofc.activity.v1.ActivityService';

  ActivityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubmitProgramActivityRequest, $0.SubmitProgramActivityResponse>(
        'SubmitProgramActivity',
        submitProgramActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SubmitProgramActivityRequest.fromBuffer(value),
        ($0.SubmitProgramActivityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProgramActivitiesRequest, $0.ProgramActivityProfile>(
        'GetProgramActivities',
        getProgramActivities_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetProgramActivitiesRequest.fromBuffer(value),
        ($0.ProgramActivityProfile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStarCouncilStatusRequest, $0.GetStarCouncilStatusResponse>(
        'GetStarCouncilStatus',
        getStarCouncilStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStarCouncilStatusRequest.fromBuffer(value),
        ($0.GetStarCouncilStatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SubmitProgramActivityResponse> submitProgramActivity_Pre($grpc.ServiceCall $call, $async.Future<$0.SubmitProgramActivityRequest> $request) async {
    return submitProgramActivity($call, await $request);
  }

  $async.Stream<$0.ProgramActivityProfile> getProgramActivities_Pre($grpc.ServiceCall $call, $async.Future<$0.GetProgramActivitiesRequest> $request) async* {
    yield* getProgramActivities($call, await $request);
  }

  $async.Future<$0.GetStarCouncilStatusResponse> getStarCouncilStatus_Pre($grpc.ServiceCall $call, $async.Future<$0.GetStarCouncilStatusRequest> $request) async {
    return getStarCouncilStatus($call, await $request);
  }

  $async.Future<$0.SubmitProgramActivityResponse> submitProgramActivity($grpc.ServiceCall call, $0.SubmitProgramActivityRequest request);
  $async.Stream<$0.ProgramActivityProfile> getProgramActivities($grpc.ServiceCall call, $0.GetProgramActivitiesRequest request);
  $async.Future<$0.GetStarCouncilStatusResponse> getStarCouncilStatus($grpc.ServiceCall call, $0.GetStarCouncilStatusRequest request);
}
