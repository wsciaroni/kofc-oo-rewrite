//
//  Generated code. Do not modify.
//  source: activity.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'activity.pbenum.dart';
import 'google/protobuf/timestamp.pb.dart' as $3;
import 'google/type/money.pb.dart' as $4;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'activity.pbenum.dart';

class SubmitProgramActivityRequest extends $pb.GeneratedMessage {
  factory SubmitProgramActivityRequest({
    $core.String? activityId,
    $core.int? councilId,
    $core.String? submitterMemberNumber,
    ProgramCategory? category,
    $core.String? activityName,
    $3.Timestamp? eventDate,
    $core.int? volunteerCount,
    $core.int? volunteerHours,
    $4.Money? moneyDonated,
    $4.Money? moneyRaised,
    $core.String? description,
    FormStatus? status,
  }) {
    final $result = create();
    if (activityId != null) {
      $result.activityId = activityId;
    }
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (submitterMemberNumber != null) {
      $result.submitterMemberNumber = submitterMemberNumber;
    }
    if (category != null) {
      $result.category = category;
    }
    if (activityName != null) {
      $result.activityName = activityName;
    }
    if (eventDate != null) {
      $result.eventDate = eventDate;
    }
    if (volunteerCount != null) {
      $result.volunteerCount = volunteerCount;
    }
    if (volunteerHours != null) {
      $result.volunteerHours = volunteerHours;
    }
    if (moneyDonated != null) {
      $result.moneyDonated = moneyDonated;
    }
    if (moneyRaised != null) {
      $result.moneyRaised = moneyRaised;
    }
    if (description != null) {
      $result.description = description;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  SubmitProgramActivityRequest._() : super();
  factory SubmitProgramActivityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitProgramActivityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitProgramActivityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'activityId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'submitterMemberNumber')
    ..e<ProgramCategory>(4, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: ProgramCategory.PROGRAM_CATEGORY_UNSPECIFIED, valueOf: ProgramCategory.valueOf, enumValues: ProgramCategory.values)
    ..aOS(5, _omitFieldNames ? '' : 'activityName')
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'eventDate', subBuilder: $3.Timestamp.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'volunteerCount', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'volunteerHours', $pb.PbFieldType.O3)
    ..aOM<$4.Money>(9, _omitFieldNames ? '' : 'moneyDonated', subBuilder: $4.Money.create)
    ..aOM<$4.Money>(10, _omitFieldNames ? '' : 'moneyRaised', subBuilder: $4.Money.create)
    ..aOS(11, _omitFieldNames ? '' : 'description')
    ..e<FormStatus>(12, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: FormStatus.FORM_STATUS_UNSPECIFIED, valueOf: FormStatus.valueOf, enumValues: FormStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitProgramActivityRequest clone() => SubmitProgramActivityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitProgramActivityRequest copyWith(void Function(SubmitProgramActivityRequest) updates) => super.copyWith((message) => updates(message as SubmitProgramActivityRequest)) as SubmitProgramActivityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitProgramActivityRequest create() => SubmitProgramActivityRequest._();
  SubmitProgramActivityRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitProgramActivityRequest> createRepeated() => $pb.PbList<SubmitProgramActivityRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitProgramActivityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitProgramActivityRequest>(create);
  static SubmitProgramActivityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get activityId => $_getSZ(0);
  @$pb.TagNumber(1)
  set activityId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get councilId => $_getIZ(1);
  @$pb.TagNumber(2)
  set councilId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCouncilId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCouncilId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get submitterMemberNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set submitterMemberNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubmitterMemberNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubmitterMemberNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  ProgramCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(ProgramCategory v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get activityName => $_getSZ(4);
  @$pb.TagNumber(5)
  set activityName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActivityName() => $_has(4);
  @$pb.TagNumber(5)
  void clearActivityName() => $_clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get eventDate => $_getN(5);
  @$pb.TagNumber(6)
  set eventDate($3.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventDate() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureEventDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get volunteerCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set volunteerCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasVolunteerCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearVolunteerCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get volunteerHours => $_getIZ(7);
  @$pb.TagNumber(8)
  set volunteerHours($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVolunteerHours() => $_has(7);
  @$pb.TagNumber(8)
  void clearVolunteerHours() => $_clearField(8);

  @$pb.TagNumber(9)
  $4.Money get moneyDonated => $_getN(8);
  @$pb.TagNumber(9)
  set moneyDonated($4.Money v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasMoneyDonated() => $_has(8);
  @$pb.TagNumber(9)
  void clearMoneyDonated() => $_clearField(9);
  @$pb.TagNumber(9)
  $4.Money ensureMoneyDonated() => $_ensure(8);

  @$pb.TagNumber(10)
  $4.Money get moneyRaised => $_getN(9);
  @$pb.TagNumber(10)
  set moneyRaised($4.Money v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMoneyRaised() => $_has(9);
  @$pb.TagNumber(10)
  void clearMoneyRaised() => $_clearField(10);
  @$pb.TagNumber(10)
  $4.Money ensureMoneyRaised() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(11)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => $_clearField(11);

  @$pb.TagNumber(12)
  FormStatus get status => $_getN(11);
  @$pb.TagNumber(12)
  set status(FormStatus v) { $_setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);
}

class SubmitProgramActivityResponse extends $pb.GeneratedMessage {
  factory SubmitProgramActivityResponse({
    $core.bool? success,
    $core.String? activityId,
    $core.String? supremeConfirmationNumber,
    $core.String? message,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (activityId != null) {
      $result.activityId = activityId;
    }
    if (supremeConfirmationNumber != null) {
      $result.supremeConfirmationNumber = supremeConfirmationNumber;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  SubmitProgramActivityResponse._() : super();
  factory SubmitProgramActivityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubmitProgramActivityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubmitProgramActivityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'activityId')
    ..aOS(3, _omitFieldNames ? '' : 'supremeConfirmationNumber')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubmitProgramActivityResponse clone() => SubmitProgramActivityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubmitProgramActivityResponse copyWith(void Function(SubmitProgramActivityResponse) updates) => super.copyWith((message) => updates(message as SubmitProgramActivityResponse)) as SubmitProgramActivityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitProgramActivityResponse create() => SubmitProgramActivityResponse._();
  SubmitProgramActivityResponse createEmptyInstance() => create();
  static $pb.PbList<SubmitProgramActivityResponse> createRepeated() => $pb.PbList<SubmitProgramActivityResponse>();
  @$core.pragma('dart2js:noInline')
  static SubmitProgramActivityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubmitProgramActivityResponse>(create);
  static SubmitProgramActivityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get activityId => $_getSZ(1);
  @$pb.TagNumber(2)
  set activityId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasActivityId() => $_has(1);
  @$pb.TagNumber(2)
  void clearActivityId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get supremeConfirmationNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set supremeConfirmationNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSupremeConfirmationNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupremeConfirmationNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);
}

class GetProgramActivitiesRequest extends $pb.GeneratedMessage {
  factory GetProgramActivitiesRequest({
    $core.int? councilId,
    $core.int? fraternalYear,
  }) {
    final $result = create();
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (fraternalYear != null) {
      $result.fraternalYear = fraternalYear;
    }
    return $result;
  }
  GetProgramActivitiesRequest._() : super();
  factory GetProgramActivitiesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProgramActivitiesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProgramActivitiesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fraternalYear', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProgramActivitiesRequest clone() => GetProgramActivitiesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProgramActivitiesRequest copyWith(void Function(GetProgramActivitiesRequest) updates) => super.copyWith((message) => updates(message as GetProgramActivitiesRequest)) as GetProgramActivitiesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProgramActivitiesRequest create() => GetProgramActivitiesRequest._();
  GetProgramActivitiesRequest createEmptyInstance() => create();
  static $pb.PbList<GetProgramActivitiesRequest> createRepeated() => $pb.PbList<GetProgramActivitiesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProgramActivitiesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProgramActivitiesRequest>(create);
  static GetProgramActivitiesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get councilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set councilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouncilId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fraternalYear => $_getIZ(1);
  @$pb.TagNumber(2)
  set fraternalYear($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFraternalYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearFraternalYear() => $_clearField(2);
}

class ProgramActivityProfile extends $pb.GeneratedMessage {
  factory ProgramActivityProfile({
    $core.String? activityId,
    $core.int? councilId,
    $core.String? submitterMemberNumber,
    ProgramCategory? category,
    $core.String? activityName,
    $3.Timestamp? eventDate,
    $core.int? volunteerCount,
    $core.int? volunteerHours,
    $4.Money? moneyDonated,
    $4.Money? moneyRaised,
    $core.String? description,
    FormStatus? status,
    $core.String? supremeConfirmationNumber,
  }) {
    final $result = create();
    if (activityId != null) {
      $result.activityId = activityId;
    }
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (submitterMemberNumber != null) {
      $result.submitterMemberNumber = submitterMemberNumber;
    }
    if (category != null) {
      $result.category = category;
    }
    if (activityName != null) {
      $result.activityName = activityName;
    }
    if (eventDate != null) {
      $result.eventDate = eventDate;
    }
    if (volunteerCount != null) {
      $result.volunteerCount = volunteerCount;
    }
    if (volunteerHours != null) {
      $result.volunteerHours = volunteerHours;
    }
    if (moneyDonated != null) {
      $result.moneyDonated = moneyDonated;
    }
    if (moneyRaised != null) {
      $result.moneyRaised = moneyRaised;
    }
    if (description != null) {
      $result.description = description;
    }
    if (status != null) {
      $result.status = status;
    }
    if (supremeConfirmationNumber != null) {
      $result.supremeConfirmationNumber = supremeConfirmationNumber;
    }
    return $result;
  }
  ProgramActivityProfile._() : super();
  factory ProgramActivityProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProgramActivityProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProgramActivityProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'activityId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'submitterMemberNumber')
    ..e<ProgramCategory>(4, _omitFieldNames ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: ProgramCategory.PROGRAM_CATEGORY_UNSPECIFIED, valueOf: ProgramCategory.valueOf, enumValues: ProgramCategory.values)
    ..aOS(5, _omitFieldNames ? '' : 'activityName')
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'eventDate', subBuilder: $3.Timestamp.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'volunteerCount', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'volunteerHours', $pb.PbFieldType.O3)
    ..aOM<$4.Money>(9, _omitFieldNames ? '' : 'moneyDonated', subBuilder: $4.Money.create)
    ..aOM<$4.Money>(10, _omitFieldNames ? '' : 'moneyRaised', subBuilder: $4.Money.create)
    ..aOS(11, _omitFieldNames ? '' : 'description')
    ..e<FormStatus>(12, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: FormStatus.FORM_STATUS_UNSPECIFIED, valueOf: FormStatus.valueOf, enumValues: FormStatus.values)
    ..aOS(13, _omitFieldNames ? '' : 'supremeConfirmationNumber')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProgramActivityProfile clone() => ProgramActivityProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProgramActivityProfile copyWith(void Function(ProgramActivityProfile) updates) => super.copyWith((message) => updates(message as ProgramActivityProfile)) as ProgramActivityProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProgramActivityProfile create() => ProgramActivityProfile._();
  ProgramActivityProfile createEmptyInstance() => create();
  static $pb.PbList<ProgramActivityProfile> createRepeated() => $pb.PbList<ProgramActivityProfile>();
  @$core.pragma('dart2js:noInline')
  static ProgramActivityProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProgramActivityProfile>(create);
  static ProgramActivityProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get activityId => $_getSZ(0);
  @$pb.TagNumber(1)
  set activityId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityId() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get councilId => $_getIZ(1);
  @$pb.TagNumber(2)
  set councilId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCouncilId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCouncilId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get submitterMemberNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set submitterMemberNumber($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSubmitterMemberNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubmitterMemberNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  ProgramCategory get category => $_getN(3);
  @$pb.TagNumber(4)
  set category(ProgramCategory v) { $_setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCategory() => $_has(3);
  @$pb.TagNumber(4)
  void clearCategory() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get activityName => $_getSZ(4);
  @$pb.TagNumber(5)
  set activityName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActivityName() => $_has(4);
  @$pb.TagNumber(5)
  void clearActivityName() => $_clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get eventDate => $_getN(5);
  @$pb.TagNumber(6)
  set eventDate($3.Timestamp v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEventDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearEventDate() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureEventDate() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get volunteerCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set volunteerCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasVolunteerCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearVolunteerCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get volunteerHours => $_getIZ(7);
  @$pb.TagNumber(8)
  set volunteerHours($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVolunteerHours() => $_has(7);
  @$pb.TagNumber(8)
  void clearVolunteerHours() => $_clearField(8);

  @$pb.TagNumber(9)
  $4.Money get moneyDonated => $_getN(8);
  @$pb.TagNumber(9)
  set moneyDonated($4.Money v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasMoneyDonated() => $_has(8);
  @$pb.TagNumber(9)
  void clearMoneyDonated() => $_clearField(9);
  @$pb.TagNumber(9)
  $4.Money ensureMoneyDonated() => $_ensure(8);

  @$pb.TagNumber(10)
  $4.Money get moneyRaised => $_getN(9);
  @$pb.TagNumber(10)
  set moneyRaised($4.Money v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMoneyRaised() => $_has(9);
  @$pb.TagNumber(10)
  void clearMoneyRaised() => $_clearField(10);
  @$pb.TagNumber(10)
  $4.Money ensureMoneyRaised() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(11)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => $_clearField(11);

  @$pb.TagNumber(12)
  FormStatus get status => $_getN(11);
  @$pb.TagNumber(12)
  set status(FormStatus v) { $_setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasStatus() => $_has(11);
  @$pb.TagNumber(12)
  void clearStatus() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get supremeConfirmationNumber => $_getSZ(12);
  @$pb.TagNumber(13)
  set supremeConfirmationNumber($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSupremeConfirmationNumber() => $_has(12);
  @$pb.TagNumber(13)
  void clearSupremeConfirmationNumber() => $_clearField(13);
}

class GetStarCouncilStatusRequest extends $pb.GeneratedMessage {
  factory GetStarCouncilStatusRequest({
    $core.int? councilId,
    $core.int? fraternalYear,
  }) {
    final $result = create();
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (fraternalYear != null) {
      $result.fraternalYear = fraternalYear;
    }
    return $result;
  }
  GetStarCouncilStatusRequest._() : super();
  factory GetStarCouncilStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStarCouncilStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStarCouncilStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fraternalYear', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStarCouncilStatusRequest clone() => GetStarCouncilStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStarCouncilStatusRequest copyWith(void Function(GetStarCouncilStatusRequest) updates) => super.copyWith((message) => updates(message as GetStarCouncilStatusRequest)) as GetStarCouncilStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStarCouncilStatusRequest create() => GetStarCouncilStatusRequest._();
  GetStarCouncilStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetStarCouncilStatusRequest> createRepeated() => $pb.PbList<GetStarCouncilStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStarCouncilStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStarCouncilStatusRequest>(create);
  static GetStarCouncilStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get councilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set councilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouncilId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fraternalYear => $_getIZ(1);
  @$pb.TagNumber(2)
  set fraternalYear($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFraternalYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearFraternalYear() => $_clearField(2);
}

class GetStarCouncilStatusResponse extends $pb.GeneratedMessage {
  factory GetStarCouncilStatusResponse({
    $core.int? councilId,
    $core.int? fraternalYear,
    $core.int? membershipTarget,
    $core.int? membershipAchieved,
    $core.bool? mcgivneyQualified,
    $core.int? insuranceSeminarsTarget,
    $core.int? insuranceSeminarsAchieved,
    $core.bool? foundersQualified,
    $core.int? faithProgramsAchieved,
    $core.int? familyProgramsAchieved,
    $core.int? communityProgramsAchieved,
    $core.int? lifeProgramsAchieved,
    $core.bool? columbianQualified,
    $core.bool? form185Submitted,
    $core.bool? form365Submitted,
    $core.bool? form1728Submitted,
    $core.bool? safeEnvironmentCompliant,
    $core.bool? starCouncilQualified,
  }) {
    final $result = create();
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (fraternalYear != null) {
      $result.fraternalYear = fraternalYear;
    }
    if (membershipTarget != null) {
      $result.membershipTarget = membershipTarget;
    }
    if (membershipAchieved != null) {
      $result.membershipAchieved = membershipAchieved;
    }
    if (mcgivneyQualified != null) {
      $result.mcgivneyQualified = mcgivneyQualified;
    }
    if (insuranceSeminarsTarget != null) {
      $result.insuranceSeminarsTarget = insuranceSeminarsTarget;
    }
    if (insuranceSeminarsAchieved != null) {
      $result.insuranceSeminarsAchieved = insuranceSeminarsAchieved;
    }
    if (foundersQualified != null) {
      $result.foundersQualified = foundersQualified;
    }
    if (faithProgramsAchieved != null) {
      $result.faithProgramsAchieved = faithProgramsAchieved;
    }
    if (familyProgramsAchieved != null) {
      $result.familyProgramsAchieved = familyProgramsAchieved;
    }
    if (communityProgramsAchieved != null) {
      $result.communityProgramsAchieved = communityProgramsAchieved;
    }
    if (lifeProgramsAchieved != null) {
      $result.lifeProgramsAchieved = lifeProgramsAchieved;
    }
    if (columbianQualified != null) {
      $result.columbianQualified = columbianQualified;
    }
    if (form185Submitted != null) {
      $result.form185Submitted = form185Submitted;
    }
    if (form365Submitted != null) {
      $result.form365Submitted = form365Submitted;
    }
    if (form1728Submitted != null) {
      $result.form1728Submitted = form1728Submitted;
    }
    if (safeEnvironmentCompliant != null) {
      $result.safeEnvironmentCompliant = safeEnvironmentCompliant;
    }
    if (starCouncilQualified != null) {
      $result.starCouncilQualified = starCouncilQualified;
    }
    return $result;
  }
  GetStarCouncilStatusResponse._() : super();
  factory GetStarCouncilStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStarCouncilStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStarCouncilStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.activity.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fraternalYear', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'membershipTarget', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'membershipAchieved', $pb.PbFieldType.O3)
    ..aOB(5, _omitFieldNames ? '' : 'mcgivneyQualified')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'insuranceSeminarsTarget', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'insuranceSeminarsAchieved', $pb.PbFieldType.O3)
    ..aOB(8, _omitFieldNames ? '' : 'foundersQualified')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'faithProgramsAchieved', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'familyProgramsAchieved', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'communityProgramsAchieved', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'lifeProgramsAchieved', $pb.PbFieldType.O3)
    ..aOB(13, _omitFieldNames ? '' : 'columbianQualified')
    ..aOB(14, _omitFieldNames ? '' : 'form185Submitted', protoName: 'form_185_submitted')
    ..aOB(15, _omitFieldNames ? '' : 'form365Submitted', protoName: 'form_365_submitted')
    ..aOB(16, _omitFieldNames ? '' : 'form1728Submitted', protoName: 'form_1728_submitted')
    ..aOB(17, _omitFieldNames ? '' : 'safeEnvironmentCompliant')
    ..aOB(18, _omitFieldNames ? '' : 'starCouncilQualified')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStarCouncilStatusResponse clone() => GetStarCouncilStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStarCouncilStatusResponse copyWith(void Function(GetStarCouncilStatusResponse) updates) => super.copyWith((message) => updates(message as GetStarCouncilStatusResponse)) as GetStarCouncilStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStarCouncilStatusResponse create() => GetStarCouncilStatusResponse._();
  GetStarCouncilStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetStarCouncilStatusResponse> createRepeated() => $pb.PbList<GetStarCouncilStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStarCouncilStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStarCouncilStatusResponse>(create);
  static GetStarCouncilStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get councilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set councilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouncilId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fraternalYear => $_getIZ(1);
  @$pb.TagNumber(2)
  set fraternalYear($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFraternalYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearFraternalYear() => $_clearField(2);

  /// McGivney Award (Membership growth)
  @$pb.TagNumber(3)
  $core.int get membershipTarget => $_getIZ(2);
  @$pb.TagNumber(3)
  set membershipTarget($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMembershipTarget() => $_has(2);
  @$pb.TagNumber(3)
  void clearMembershipTarget() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get membershipAchieved => $_getIZ(3);
  @$pb.TagNumber(4)
  set membershipAchieved($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMembershipAchieved() => $_has(3);
  @$pb.TagNumber(4)
  void clearMembershipAchieved() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get mcgivneyQualified => $_getBF(4);
  @$pb.TagNumber(5)
  set mcgivneyQualified($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMcgivneyQualified() => $_has(4);
  @$pb.TagNumber(5)
  void clearMcgivneyQualified() => $_clearField(5);

  /// Founders' Award (Insurance seminars)
  @$pb.TagNumber(6)
  $core.int get insuranceSeminarsTarget => $_getIZ(5);
  @$pb.TagNumber(6)
  set insuranceSeminarsTarget($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInsuranceSeminarsTarget() => $_has(5);
  @$pb.TagNumber(6)
  void clearInsuranceSeminarsTarget() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get insuranceSeminarsAchieved => $_getIZ(6);
  @$pb.TagNumber(7)
  set insuranceSeminarsAchieved($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInsuranceSeminarsAchieved() => $_has(6);
  @$pb.TagNumber(7)
  void clearInsuranceSeminarsAchieved() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get foundersQualified => $_getBF(7);
  @$pb.TagNumber(8)
  set foundersQualified($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFoundersQualified() => $_has(7);
  @$pb.TagNumber(8)
  void clearFoundersQualified() => $_clearField(8);

  /// Columbian Award (Service Programs - 4 in each category required)
  @$pb.TagNumber(9)
  $core.int get faithProgramsAchieved => $_getIZ(8);
  @$pb.TagNumber(9)
  set faithProgramsAchieved($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFaithProgramsAchieved() => $_has(8);
  @$pb.TagNumber(9)
  void clearFaithProgramsAchieved() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get familyProgramsAchieved => $_getIZ(9);
  @$pb.TagNumber(10)
  set familyProgramsAchieved($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFamilyProgramsAchieved() => $_has(9);
  @$pb.TagNumber(10)
  void clearFamilyProgramsAchieved() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.int get communityProgramsAchieved => $_getIZ(10);
  @$pb.TagNumber(11)
  set communityProgramsAchieved($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCommunityProgramsAchieved() => $_has(10);
  @$pb.TagNumber(11)
  void clearCommunityProgramsAchieved() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get lifeProgramsAchieved => $_getIZ(11);
  @$pb.TagNumber(12)
  set lifeProgramsAchieved($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLifeProgramsAchieved() => $_has(11);
  @$pb.TagNumber(12)
  void clearLifeProgramsAchieved() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get columbianQualified => $_getBF(12);
  @$pb.TagNumber(13)
  set columbianQualified($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasColumbianQualified() => $_has(12);
  @$pb.TagNumber(13)
  void clearColumbianQualified() => $_clearField(13);

  /// Required Forms Compliance
  @$pb.TagNumber(14)
  $core.bool get form185Submitted => $_getBF(13);
  @$pb.TagNumber(14)
  set form185Submitted($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasForm185Submitted() => $_has(13);
  @$pb.TagNumber(14)
  void clearForm185Submitted() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get form365Submitted => $_getBF(14);
  @$pb.TagNumber(15)
  set form365Submitted($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasForm365Submitted() => $_has(14);
  @$pb.TagNumber(15)
  void clearForm365Submitted() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get form1728Submitted => $_getBF(15);
  @$pb.TagNumber(16)
  set form1728Submitted($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasForm1728Submitted() => $_has(15);
  @$pb.TagNumber(16)
  void clearForm1728Submitted() => $_clearField(16);

  /// Safe Environment Compliance
  @$pb.TagNumber(17)
  $core.bool get safeEnvironmentCompliant => $_getBF(16);
  @$pb.TagNumber(17)
  set safeEnvironmentCompliant($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasSafeEnvironmentCompliant() => $_has(16);
  @$pb.TagNumber(17)
  void clearSafeEnvironmentCompliant() => $_clearField(17);

  /// Final Overall Award Status
  @$pb.TagNumber(18)
  $core.bool get starCouncilQualified => $_getBF(17);
  @$pb.TagNumber(18)
  set starCouncilQualified($core.bool v) { $_setBool(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasStarCouncilQualified() => $_has(17);
  @$pb.TagNumber(18)
  void clearStarCouncilQualified() => $_clearField(18);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
