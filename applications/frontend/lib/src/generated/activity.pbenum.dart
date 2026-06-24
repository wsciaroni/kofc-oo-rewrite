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

class ProgramCategory extends $pb.ProtobufEnum {
  static const ProgramCategory PROGRAM_CATEGORY_UNSPECIFIED = ProgramCategory._(0, _omitEnumNames ? '' : 'PROGRAM_CATEGORY_UNSPECIFIED');
  static const ProgramCategory PROGRAM_CATEGORY_FAITH = ProgramCategory._(1, _omitEnumNames ? '' : 'PROGRAM_CATEGORY_FAITH');
  static const ProgramCategory PROGRAM_CATEGORY_FAMILY = ProgramCategory._(2, _omitEnumNames ? '' : 'PROGRAM_CATEGORY_FAMILY');
  static const ProgramCategory PROGRAM_CATEGORY_COMMUNITY = ProgramCategory._(3, _omitEnumNames ? '' : 'PROGRAM_CATEGORY_COMMUNITY');
  static const ProgramCategory PROGRAM_CATEGORY_LIFE = ProgramCategory._(4, _omitEnumNames ? '' : 'PROGRAM_CATEGORY_LIFE');

  static const $core.List<ProgramCategory> values = <ProgramCategory> [
    PROGRAM_CATEGORY_UNSPECIFIED,
    PROGRAM_CATEGORY_FAITH,
    PROGRAM_CATEGORY_FAMILY,
    PROGRAM_CATEGORY_COMMUNITY,
    PROGRAM_CATEGORY_LIFE,
  ];

  static final $core.Map<$core.int, ProgramCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProgramCategory? valueOf($core.int value) => _byValue[value];

  const ProgramCategory._(super.v, super.n);
}

class FormStatus extends $pb.ProtobufEnum {
  static const FormStatus FORM_STATUS_UNSPECIFIED = FormStatus._(0, _omitEnumNames ? '' : 'FORM_STATUS_UNSPECIFIED');
  static const FormStatus FORM_STATUS_DRAFT = FormStatus._(1, _omitEnumNames ? '' : 'FORM_STATUS_DRAFT');
  static const FormStatus FORM_STATUS_PENDING_SYNC = FormStatus._(2, _omitEnumNames ? '' : 'FORM_STATUS_PENDING_SYNC');
  static const FormStatus FORM_STATUS_SUBMITTED = FormStatus._(3, _omitEnumNames ? '' : 'FORM_STATUS_SUBMITTED');

  static const $core.List<FormStatus> values = <FormStatus> [
    FORM_STATUS_UNSPECIFIED,
    FORM_STATUS_DRAFT,
    FORM_STATUS_PENDING_SYNC,
    FORM_STATUS_SUBMITTED,
  ];

  static final $core.Map<$core.int, FormStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FormStatus? valueOf($core.int value) => _byValue[value];

  const FormStatus._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
