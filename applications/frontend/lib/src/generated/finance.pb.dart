//
//  Generated code. Do not modify.
//  source: finance.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'finance.pbenum.dart';
import 'google/type/money.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'finance.pbenum.dart';

class TransactionRequest extends $pb.GeneratedMessage {
  factory TransactionRequest({
    $core.int? councilId,
    TransactionType? type,
    $2.Money? amount,
    $core.String? description,
    $core.String? checkNumber,
    $core.int? linkedMemberId,
  }) {
    final $result = create();
    if (councilId != null) {
      $result.councilId = councilId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (description != null) {
      $result.description = description;
    }
    if (checkNumber != null) {
      $result.checkNumber = checkNumber;
    }
    if (linkedMemberId != null) {
      $result.linkedMemberId = linkedMemberId;
    }
    return $result;
  }
  TransactionRequest._() : super();
  factory TransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.finance.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'councilId', $pb.PbFieldType.O3)
    ..e<TransactionType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TransactionType.TRANSACTION_TYPE_UNSPECIFIED, valueOf: TransactionType.valueOf, enumValues: TransactionType.values)
    ..aOM<$2.Money>(3, _omitFieldNames ? '' : 'amount', subBuilder: $2.Money.create)
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'checkNumber')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'linkedMemberId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionRequest clone() => TransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionRequest copyWith(void Function(TransactionRequest) updates) => super.copyWith((message) => updates(message as TransactionRequest)) as TransactionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionRequest create() => TransactionRequest._();
  TransactionRequest createEmptyInstance() => create();
  static $pb.PbList<TransactionRequest> createRepeated() => $pb.PbList<TransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static TransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionRequest>(create);
  static TransactionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get councilId => $_getIZ(0);
  @$pb.TagNumber(1)
  set councilId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCouncilId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCouncilId() => $_clearField(1);

  @$pb.TagNumber(2)
  TransactionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(TransactionType v) { $_setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.Money get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($2.Money v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Money ensureAmount() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get checkNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set checkNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCheckNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearCheckNumber() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get linkedMemberId => $_getIZ(5);
  @$pb.TagNumber(6)
  set linkedMemberId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLinkedMemberId() => $_has(5);
  @$pb.TagNumber(6)
  void clearLinkedMemberId() => $_clearField(6);
}

/// Added to make the proto compilable
class TransactionResponse extends $pb.GeneratedMessage {
  factory TransactionResponse({
    $core.bool? success,
    $core.String? transactionId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (transactionId != null) {
      $result.transactionId = transactionId;
    }
    return $result;
  }
  TransactionResponse._() : super();
  factory TransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.finance.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'transactionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionResponse clone() => TransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionResponse copyWith(void Function(TransactionResponse) updates) => super.copyWith((message) => updates(message as TransactionResponse)) as TransactionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionResponse create() => TransactionResponse._();
  TransactionResponse createEmptyInstance() => create();
  static $pb.PbList<TransactionResponse> createRepeated() => $pb.PbList<TransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static TransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionResponse>(create);
  static TransactionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get transactionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set transactionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionId() => $_clearField(2);
}

class DuesUpdateRequest extends $pb.GeneratedMessage {
  factory DuesUpdateRequest({
    $core.int? memberId,
    $core.bool? isPaid,
  }) {
    final $result = create();
    if (memberId != null) {
      $result.memberId = memberId;
    }
    if (isPaid != null) {
      $result.isPaid = isPaid;
    }
    return $result;
  }
  DuesUpdateRequest._() : super();
  factory DuesUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DuesUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DuesUpdateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.finance.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'memberId', $pb.PbFieldType.O3)
    ..aOB(2, _omitFieldNames ? '' : 'isPaid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DuesUpdateRequest clone() => DuesUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DuesUpdateRequest copyWith(void Function(DuesUpdateRequest) updates) => super.copyWith((message) => updates(message as DuesUpdateRequest)) as DuesUpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DuesUpdateRequest create() => DuesUpdateRequest._();
  DuesUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<DuesUpdateRequest> createRepeated() => $pb.PbList<DuesUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static DuesUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DuesUpdateRequest>(create);
  static DuesUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get memberId => $_getIZ(0);
  @$pb.TagNumber(1)
  set memberId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMemberId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMemberId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isPaid => $_getBF(1);
  @$pb.TagNumber(2)
  set isPaid($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsPaid() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsPaid() => $_clearField(2);
}

class DuesUpdateResponse extends $pb.GeneratedMessage {
  factory DuesUpdateResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DuesUpdateResponse._() : super();
  factory DuesUpdateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DuesUpdateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DuesUpdateResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'kofc.finance.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DuesUpdateResponse clone() => DuesUpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DuesUpdateResponse copyWith(void Function(DuesUpdateResponse) updates) => super.copyWith((message) => updates(message as DuesUpdateResponse)) as DuesUpdateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DuesUpdateResponse create() => DuesUpdateResponse._();
  DuesUpdateResponse createEmptyInstance() => create();
  static $pb.PbList<DuesUpdateResponse> createRepeated() => $pb.PbList<DuesUpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static DuesUpdateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DuesUpdateResponse>(create);
  static DuesUpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
