//
//  Generated code. Do not modify.
//  source: membership.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FindCandidateRequest extends $pb.GeneratedMessage {
  factory FindCandidateRequest({
    $core.String? firstName,
    $core.String? lastName,
    $3.Timestamp? dateOfBirth,
  }) {
    final $result = create();
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (dateOfBirth != null) {
      $result.dateOfBirth = dateOfBirth;
    }
    return $result;
  }
  FindCandidateRequest._() : super();
  factory FindCandidateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCandidateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCandidateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName')
    ..aOM<$3.Timestamp>(3, _omitFieldNames ? '' : 'dateOfBirth', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCandidateRequest clone() => FindCandidateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCandidateRequest copyWith(void Function(FindCandidateRequest) updates) => super.copyWith((message) => updates(message as FindCandidateRequest)) as FindCandidateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCandidateRequest create() => FindCandidateRequest._();
  FindCandidateRequest createEmptyInstance() => create();
  static $pb.PbList<FindCandidateRequest> createRepeated() => $pb.PbList<FindCandidateRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCandidateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCandidateRequest>(create);
  static FindCandidateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => $_clearField(2);

  @$pb.TagNumber(3)
  $3.Timestamp get dateOfBirth => $_getN(2);
  @$pb.TagNumber(3)
  set dateOfBirth($3.Timestamp v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateOfBirth() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateOfBirth() => $_clearField(3);
  @$pb.TagNumber(3)
  $3.Timestamp ensureDateOfBirth() => $_ensure(2);
}

class FindCandidateResponse extends $pb.GeneratedMessage {
  factory FindCandidateResponse({
    $core.bool? exists,
    $core.int? existingCouncilId,
    $core.String? memberNumber,
  }) {
    final $result = create();
    if (exists != null) {
      $result.exists = exists;
    }
    if (existingCouncilId != null) {
      $result.existingCouncilId = existingCouncilId;
    }
    if (memberNumber != null) {
      $result.memberNumber = memberNumber;
    }
    return $result;
  }
  FindCandidateResponse._() : super();
  factory FindCandidateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCandidateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCandidateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'exists')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'existingCouncilId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'memberNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCandidateResponse clone() => FindCandidateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCandidateResponse copyWith(void Function(FindCandidateResponse) updates) => super.copyWith((message) => updates(message as FindCandidateResponse)) as FindCandidateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCandidateResponse create() => FindCandidateResponse._();
  FindCandidateResponse createEmptyInstance() => create();
  static $pb.PbList<FindCandidateResponse> createRepeated() => $pb.PbList<FindCandidateResponse>();
  @$core.pragma('dart2js:noInline')
  static FindCandidateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCandidateResponse>(create);
  static FindCandidateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exists => $_getBF(0);
  @$pb.TagNumber(1)
  set exists($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExists() => $_has(0);
  @$pb.TagNumber(1)
  void clearExists() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get existingCouncilId => $_getIZ(1);
  @$pb.TagNumber(2)
  set existingCouncilId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExistingCouncilId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExistingCouncilId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get memberNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set memberNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMemberNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberNumber() => $_clearField(3);
}

class ProcessCandidateRequest extends $pb.GeneratedMessage {
  factory ProcessCandidateRequest({
    $core.int? targetCouncilId,
    $core.String? firstName,
    $core.String? lastName,
    $3.Timestamp? processDate,
    $3.Timestamp? ceremonialDate,
  }) {
    final $result = create();
    if (targetCouncilId != null) {
      $result.targetCouncilId = targetCouncilId;
    }
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (processDate != null) {
      $result.processDate = processDate;
    }
    if (ceremonialDate != null) {
      $result.ceremonialDate = ceremonialDate;
    }
    return $result;
  }
  ProcessCandidateRequest._() : super();
  factory ProcessCandidateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProcessCandidateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProcessCandidateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'targetCouncilId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'firstName')
    ..aOS(3, _omitFieldNames ? '' : 'lastName')
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'processDate', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(5, _omitFieldNames ? '' : 'ceremonialDate', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProcessCandidateRequest clone() => ProcessCandidateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProcessCandidateRequest copyWith(void Function(ProcessCandidateRequest) updates) => super.copyWith((message) => updates(message as ProcessCandidateRequest)) as ProcessCandidateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessCandidateRequest create() => ProcessCandidateRequest._();
  ProcessCandidateRequest createEmptyInstance() => create();
  static $pb.PbList<ProcessCandidateRequest> createRepeated() => $pb.PbList<ProcessCandidateRequest>();
  @$core.pragma('dart2js:noInline')
  static ProcessCandidateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProcessCandidateRequest>(create);
  static ProcessCandidateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get targetCouncilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set targetCouncilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetCouncilId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => $_clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get processDate => $_getN(3);
  @$pb.TagNumber(4)
  set processDate($3.Timestamp v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasProcessDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearProcessDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureProcessDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $3.Timestamp get ceremonialDate => $_getN(4);
  @$pb.TagNumber(5)
  set ceremonialDate($3.Timestamp v) { $_setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCeremonialDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearCeremonialDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $3.Timestamp ensureCeremonialDate() => $_ensure(4);
}

/// Added to make the proto compilable as RosterRequest and MemberProfile are referenced but not defined in the excerpt
class CandidateResponse extends $pb.GeneratedMessage {
  factory CandidateResponse({
    $core.bool? success,
    $core.String? message,
    $core.String? memberId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    if (memberId != null) {
      $result.memberId = memberId;
    }
    return $result;
  }
  CandidateResponse._() : super();
  factory CandidateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CandidateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CandidateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOS(3, _omitFieldNames ? '' : 'memberId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CandidateResponse clone() => CandidateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CandidateResponse copyWith(void Function(CandidateResponse) updates) => super.copyWith((message) => updates(message as CandidateResponse)) as CandidateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CandidateResponse create() => CandidateResponse._();
  CandidateResponse createEmptyInstance() => create();
  static $pb.PbList<CandidateResponse> createRepeated() => $pb.PbList<CandidateResponse>();
  @$core.pragma('dart2js:noInline')
  static CandidateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CandidateResponse>(create);
  static CandidateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get memberId => $_getSZ(2);
  @$pb.TagNumber(3)
  set memberId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMemberId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberId() => $_clearField(3);
}

class RosterRequest extends $pb.GeneratedMessage {
  factory RosterRequest({
    $core.int? councilId,
  }) {
    final $result = create();
    if (councilId != null) {
      $result.councilId = councilId;
    }
    return $result;
  }
  RosterRequest._() : super();
  factory RosterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RosterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RosterRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RosterRequest clone() => RosterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RosterRequest copyWith(void Function(RosterRequest) updates) => super.copyWith((message) => updates(message as RosterRequest)) as RosterRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RosterRequest create() => RosterRequest._();
  RosterRequest createEmptyInstance() => create();
  static $pb.PbList<RosterRequest> createRepeated() => $pb.PbList<RosterRequest>();
  @$core.pragma('dart2js:noInline')
  static RosterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RosterRequest>(create);
  static RosterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get councilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set councilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouncilId() => $_clearField(1);
}

class MemberProfile extends $pb.GeneratedMessage {
  factory MemberProfile({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? memberNumber,
  }) {
    final $result = create();
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (memberNumber != null) {
      $result.memberNumber = memberNumber;
    }
    return $result;
  }
  MemberProfile._() : super();
  factory MemberProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MemberProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MemberProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.membership.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName')
    ..aOS(3, _omitFieldNames ? '' : 'memberNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MemberProfile clone() => MemberProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MemberProfile copyWith(void Function(MemberProfile) updates) => super.copyWith((message) => updates(message as MemberProfile)) as MemberProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MemberProfile create() => MemberProfile._();
  MemberProfile createEmptyInstance() => create();
  static $pb.PbList<MemberProfile> createRepeated() => $pb.PbList<MemberProfile>();
  @$core.pragma('dart2js:noInline')
  static MemberProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MemberProfile>(create);
  static MemberProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get memberNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set memberNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMemberNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearMemberNumber() => $_clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
