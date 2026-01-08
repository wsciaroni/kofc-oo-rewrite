//
//  Generated code. Do not modify.
//  source: membership.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use findCandidateRequestDescriptor instead')
const FindCandidateRequest$json = {
  '1': 'FindCandidateRequest',
  '2': [
    {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'date_of_birth', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateOfBirth'},
  ],
};

/// Descriptor for `FindCandidateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCandidateRequestDescriptor = $convert.base64Decode(
    'ChRGaW5kQ2FuZGlkYXRlUmVxdWVzdBIdCgpmaXJzdF9uYW1lGAEgASgJUglmaXJzdE5hbWUSGw'
    'oJbGFzdF9uYW1lGAIgASgJUghsYXN0TmFtZRI+Cg1kYXRlX29mX2JpcnRoGAMgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFILZGF0ZU9mQmlydGg=');

@$core.Deprecated('Use findCandidateResponseDescriptor instead')
const FindCandidateResponse$json = {
  '1': 'FindCandidateResponse',
  '2': [
    {'1': 'exists', '3': 1, '4': 1, '5': 8, '10': 'exists'},
    {'1': 'existing_council_id', '3': 2, '4': 1, '5': 5, '10': 'existingCouncilId'},
    {'1': 'member_number', '3': 3, '4': 1, '5': 9, '10': 'memberNumber'},
  ],
};

/// Descriptor for `FindCandidateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCandidateResponseDescriptor = $convert.base64Decode(
    'ChVGaW5kQ2FuZGlkYXRlUmVzcG9uc2USFgoGZXhpc3RzGAEgASgIUgZleGlzdHMSLgoTZXhpc3'
    'RpbmdfY291bmNpbF9pZBgCIAEoBVIRZXhpc3RpbmdDb3VuY2lsSWQSIwoNbWVtYmVyX251bWJl'
    'chgDIAEoCVIMbWVtYmVyTnVtYmVy');

@$core.Deprecated('Use processCandidateRequestDescriptor instead')
const ProcessCandidateRequest$json = {
  '1': 'ProcessCandidateRequest',
  '2': [
    {'1': 'target_council_id', '3': 1, '4': 1, '5': 5, '10': 'targetCouncilId'},
    {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'process_date', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'processDate'},
    {'1': 'ceremonial_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'ceremonialDate'},
  ],
};

/// Descriptor for `ProcessCandidateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processCandidateRequestDescriptor = $convert.base64Decode(
    'ChdQcm9jZXNzQ2FuZGlkYXRlUmVxdWVzdBIqChF0YXJnZXRfY291bmNpbF9pZBgBIAEoBVIPdG'
    'FyZ2V0Q291bmNpbElkEh0KCmZpcnN0X25hbWUYAiABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25h'
    'bWUYAyABKAlSCGxhc3ROYW1lEj0KDHByb2Nlc3NfZGF0ZRgEIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSC3Byb2Nlc3NEYXRlEkMKD2NlcmVtb25pYWxfZGF0ZRgFIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDmNlcmVtb25pYWxEYXRl');

@$core.Deprecated('Use candidateResponseDescriptor instead')
const CandidateResponse$json = {
  '1': 'CandidateResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'member_id', '3': 3, '4': 1, '5': 9, '10': 'memberId'},
  ],
};

/// Descriptor for `CandidateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List candidateResponseDescriptor = $convert.base64Decode(
    'ChFDYW5kaWRhdGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2'
    'UYAiABKAlSB21lc3NhZ2USGwoJbWVtYmVyX2lkGAMgASgJUghtZW1iZXJJZA==');

@$core.Deprecated('Use rosterRequestDescriptor instead')
const RosterRequest$json = {
  '1': 'RosterRequest',
  '2': [
    {'1': 'council_id', '3': 1, '4': 1, '5': 5, '10': 'councilId'},
  ],
};

/// Descriptor for `RosterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rosterRequestDescriptor = $convert.base64Decode(
    'Cg1Sb3N0ZXJSZXF1ZXN0Eh0KCmNvdW5jaWxfaWQYASABKAVSCWNvdW5jaWxJZA==');

@$core.Deprecated('Use memberProfileDescriptor instead')
const MemberProfile$json = {
  '1': 'MemberProfile',
  '2': [
    {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'member_number', '3': 3, '4': 1, '5': 9, '10': 'memberNumber'},
  ],
};

/// Descriptor for `MemberProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberProfileDescriptor = $convert.base64Decode(
    'Cg1NZW1iZXJQcm9maWxlEh0KCmZpcnN0X25hbWUYASABKAlSCWZpcnN0TmFtZRIbCglsYXN0X2'
    '5hbWUYAiABKAlSCGxhc3ROYW1lEiMKDW1lbWJlcl9udW1iZXIYAyABKAlSDG1lbWJlck51bWJl'
    'cg==');
