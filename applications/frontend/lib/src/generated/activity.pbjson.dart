//
//  Generated code. Do not modify.
//  source: activity.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use programCategoryDescriptor instead')
const ProgramCategory$json = {
  '1': 'ProgramCategory',
  '2': [
    {'1': 'PROGRAM_CATEGORY_UNSPECIFIED', '2': 0},
    {'1': 'PROGRAM_CATEGORY_FAITH', '2': 1},
    {'1': 'PROGRAM_CATEGORY_FAMILY', '2': 2},
    {'1': 'PROGRAM_CATEGORY_COMMUNITY', '2': 3},
    {'1': 'PROGRAM_CATEGORY_LIFE', '2': 4},
  ],
};

/// Descriptor for `ProgramCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List programCategoryDescriptor = $convert.base64Decode(
    'Cg9Qcm9ncmFtQ2F0ZWdvcnkSIAocUFJPR1JBTV9DQVRFR09SWV9VTlNQRUNJRklFRBAAEhoKFl'
    'BST0dSQU1fQ0FURUdPUllfRkFJVEgQARIbChdQUk9HUkFNX0NBVEVHT1JZX0ZBTUlMWRACEh4K'
    'GlBST0dSQU1fQ0FURUdPUllfQ09NTVVOSVRZEAMSGQoVUFJPR1JBTV9DQVRFR09SWV9MSUZFEA'
    'Q=');

@$core.Deprecated('Use formStatusDescriptor instead')
const FormStatus$json = {
  '1': 'FormStatus',
  '2': [
    {'1': 'FORM_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'FORM_STATUS_DRAFT', '2': 1},
    {'1': 'FORM_STATUS_PENDING_SYNC', '2': 2},
    {'1': 'FORM_STATUS_SUBMITTED', '2': 3},
  ],
};

/// Descriptor for `FormStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List formStatusDescriptor = $convert.base64Decode(
    'CgpGb3JtU3RhdHVzEhsKF0ZPUk1fU1RBVFVTX1VOU1BFQ0lGSUVEEAASFQoRRk9STV9TVEFUVV'
    'NfRFJBRlQQARIcChhGT1JNX1NUQVRVU19QRU5ESU5HX1NZTkMQAhIZChVGT1JNX1NUQVRVU19T'
    'VUJNSVRURUQQAw==');

@$core.Deprecated('Use submitProgramActivityRequestDescriptor instead')
const SubmitProgramActivityRequest$json = {
  '1': 'SubmitProgramActivityRequest',
  '2': [
    {'1': 'activity_id', '3': 1, '4': 1, '5': 9, '10': 'activityId'},
    {'1': 'council_id', '3': 2, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'submitter_member_number', '3': 3, '4': 1, '5': 9, '10': 'submitterMemberNumber'},
    {'1': 'category', '3': 4, '4': 1, '5': 14, '6': '.kofc.activity.v1.ProgramCategory', '10': 'category'},
    {'1': 'activity_name', '3': 5, '4': 1, '5': 9, '10': 'activityName'},
    {'1': 'event_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventDate'},
    {'1': 'volunteer_count', '3': 7, '4': 1, '5': 5, '10': 'volunteerCount'},
    {'1': 'volunteer_hours', '3': 8, '4': 1, '5': 5, '10': 'volunteerHours'},
    {'1': 'money_donated', '3': 9, '4': 1, '5': 11, '6': '.google.type.Money', '10': 'moneyDonated'},
    {'1': 'money_raised', '3': 10, '4': 1, '5': 11, '6': '.google.type.Money', '10': 'moneyRaised'},
    {'1': 'description', '3': 11, '4': 1, '5': 9, '10': 'description'},
    {'1': 'status', '3': 12, '4': 1, '5': 14, '6': '.kofc.activity.v1.FormStatus', '10': 'status'},
  ],
};

/// Descriptor for `SubmitProgramActivityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitProgramActivityRequestDescriptor = $convert.base64Decode(
    'ChxTdWJtaXRQcm9ncmFtQWN0aXZpdHlSZXF1ZXN0Eh8KC2FjdGl2aXR5X2lkGAEgASgJUgphY3'
    'Rpdml0eUlkEh0KCmNvdW5jaWxfaWQYAiABKAVSCWNvdW5jaWxJZBI2ChdzdWJtaXR0ZXJfbWVt'
    'YmVyX251bWJlchgDIAEoCVIVc3VibWl0dGVyTWVtYmVyTnVtYmVyEj0KCGNhdGVnb3J5GAQgAS'
    'gOMiEua29mYy5hY3Rpdml0eS52MS5Qcm9ncmFtQ2F0ZWdvcnlSCGNhdGVnb3J5EiMKDWFjdGl2'
    'aXR5X25hbWUYBSABKAlSDGFjdGl2aXR5TmFtZRI5CgpldmVudF9kYXRlGAYgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXZlbnREYXRlEicKD3ZvbHVudGVlcl9jb3VudBgHIAEo'
    'BVIOdm9sdW50ZWVyQ291bnQSJwoPdm9sdW50ZWVyX2hvdXJzGAggASgFUg52b2x1bnRlZXJIb3'
    'VycxI3Cg1tb25leV9kb25hdGVkGAkgASgLMhIuZ29vZ2xlLnR5cGUuTW9uZXlSDG1vbmV5RG9u'
    'YXRlZBI1Cgxtb25leV9yYWlzZWQYCiABKAsyEi5nb29nbGUudHlwZS5Nb25leVILbW9uZXlSYW'
    'lzZWQSIAoLZGVzY3JpcHRpb24YCyABKAlSC2Rlc2NyaXB0aW9uEjQKBnN0YXR1cxgMIAEoDjIc'
    'LmtvZmMuYWN0aXZpdHkudjEuRm9ybVN0YXR1c1IGc3RhdHVz');

@$core.Deprecated('Use submitProgramActivityResponseDescriptor instead')
const SubmitProgramActivityResponse$json = {
  '1': 'SubmitProgramActivityResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'activity_id', '3': 2, '4': 1, '5': 9, '10': 'activityId'},
    {'1': 'supreme_confirmation_number', '3': 3, '4': 1, '5': 9, '10': 'supremeConfirmationNumber'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SubmitProgramActivityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitProgramActivityResponseDescriptor = $convert.base64Decode(
    'Ch1TdWJtaXRQcm9ncmFtQWN0aXZpdHlSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
    'NzEh8KC2FjdGl2aXR5X2lkGAIgASgJUgphY3Rpdml0eUlkEj4KG3N1cHJlbWVfY29uZmlybWF0'
    'aW9uX251bWJlchgDIAEoCVIZc3VwcmVtZUNvbmZpcm1hdGlvbk51bWJlchIYCgdtZXNzYWdlGA'
    'QgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getProgramActivitiesRequestDescriptor instead')
const GetProgramActivitiesRequest$json = {
  '1': 'GetProgramActivitiesRequest',
  '2': [
    {'1': 'council_id', '3': 1, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'fraternal_year', '3': 2, '4': 1, '5': 5, '10': 'fraternalYear'},
  ],
};

/// Descriptor for `GetProgramActivitiesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProgramActivitiesRequestDescriptor = $convert.base64Decode(
    'ChtHZXRQcm9ncmFtQWN0aXZpdGllc1JlcXVlc3QSHQoKY291bmNpbF9pZBgBIAEoBVIJY291bm'
    'NpbElkEiUKDmZyYXRlcm5hbF95ZWFyGAIgASgFUg1mcmF0ZXJuYWxZZWFy');

@$core.Deprecated('Use programActivityProfileDescriptor instead')
const ProgramActivityProfile$json = {
  '1': 'ProgramActivityProfile',
  '2': [
    {'1': 'activity_id', '3': 1, '4': 1, '5': 9, '10': 'activityId'},
    {'1': 'council_id', '3': 2, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'submitter_member_number', '3': 3, '4': 1, '5': 9, '10': 'submitterMemberNumber'},
    {'1': 'category', '3': 4, '4': 1, '5': 14, '6': '.kofc.activity.v1.ProgramCategory', '10': 'category'},
    {'1': 'activity_name', '3': 5, '4': 1, '5': 9, '10': 'activityName'},
    {'1': 'event_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'eventDate'},
    {'1': 'volunteer_count', '3': 7, '4': 1, '5': 5, '10': 'volunteerCount'},
    {'1': 'volunteer_hours', '3': 8, '4': 1, '5': 5, '10': 'volunteerHours'},
    {'1': 'money_donated', '3': 9, '4': 1, '5': 11, '6': '.google.type.Money', '10': 'moneyDonated'},
    {'1': 'money_raised', '3': 10, '4': 1, '5': 11, '6': '.google.type.Money', '10': 'moneyRaised'},
    {'1': 'description', '3': 11, '4': 1, '5': 9, '10': 'description'},
    {'1': 'status', '3': 12, '4': 1, '5': 14, '6': '.kofc.activity.v1.FormStatus', '10': 'status'},
    {'1': 'supreme_confirmation_number', '3': 13, '4': 1, '5': 9, '10': 'supremeConfirmationNumber'},
  ],
};

/// Descriptor for `ProgramActivityProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List programActivityProfileDescriptor = $convert.base64Decode(
    'ChZQcm9ncmFtQWN0aXZpdHlQcm9maWxlEh8KC2FjdGl2aXR5X2lkGAEgASgJUgphY3Rpdml0eU'
    'lkEh0KCmNvdW5jaWxfaWQYAiABKAVSCWNvdW5jaWxJZBI2ChdzdWJtaXR0ZXJfbWVtYmVyX251'
    'bWJlchgDIAEoCVIVc3VibWl0dGVyTWVtYmVyTnVtYmVyEj0KCGNhdGVnb3J5GAQgASgOMiEua2'
    '9mYy5hY3Rpdml0eS52MS5Qcm9ncmFtQ2F0ZWdvcnlSCGNhdGVnb3J5EiMKDWFjdGl2aXR5X25h'
    'bWUYBSABKAlSDGFjdGl2aXR5TmFtZRI5CgpldmVudF9kYXRlGAYgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJZXZlbnREYXRlEicKD3ZvbHVudGVlcl9jb3VudBgHIAEoBVIOdm9s'
    'dW50ZWVyQ291bnQSJwoPdm9sdW50ZWVyX2hvdXJzGAggASgFUg52b2x1bnRlZXJIb3VycxI3Cg'
    '1tb25leV9kb25hdGVkGAkgASgLMhIuZ29vZ2xlLnR5cGUuTW9uZXlSDG1vbmV5RG9uYXRlZBI1'
    'Cgxtb25leV9yYWlzZWQYCiABKAsyEi5nb29nbGUudHlwZS5Nb25leVILbW9uZXlSYWlzZWQSIA'
    'oLZGVzY3JpcHRpb24YCyABKAlSC2Rlc2NyaXB0aW9uEjQKBnN0YXR1cxgMIAEoDjIcLmtvZmMu'
    'YWN0aXZpdHkudjEuRm9ybVN0YXR1c1IGc3RhdHVzEj4KG3N1cHJlbWVfY29uZmlybWF0aW9uX2'
    '51bWJlchgNIAEoCVIZc3VwcmVtZUNvbmZpcm1hdGlvbk51bWJlcg==');

@$core.Deprecated('Use getStarCouncilStatusRequestDescriptor instead')
const GetStarCouncilStatusRequest$json = {
  '1': 'GetStarCouncilStatusRequest',
  '2': [
    {'1': 'council_id', '3': 1, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'fraternal_year', '3': 2, '4': 1, '5': 5, '10': 'fraternalYear'},
  ],
};

/// Descriptor for `GetStarCouncilStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStarCouncilStatusRequestDescriptor = $convert.base64Decode(
    'ChtHZXRTdGFyQ291bmNpbFN0YXR1c1JlcXVlc3QSHQoKY291bmNpbF9pZBgBIAEoBVIJY291bm'
    'NpbElkEiUKDmZyYXRlcm5hbF95ZWFyGAIgASgFUg1mcmF0ZXJuYWxZZWFy');

@$core.Deprecated('Use getStarCouncilStatusResponseDescriptor instead')
const GetStarCouncilStatusResponse$json = {
  '1': 'GetStarCouncilStatusResponse',
  '2': [
    {'1': 'council_id', '3': 1, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'fraternal_year', '3': 2, '4': 1, '5': 5, '10': 'fraternalYear'},
    {'1': 'membership_target', '3': 3, '4': 1, '5': 5, '10': 'membershipTarget'},
    {'1': 'membership_achieved', '3': 4, '4': 1, '5': 5, '10': 'membershipAchieved'},
    {'1': 'mcgivney_qualified', '3': 5, '4': 1, '5': 8, '10': 'mcgivneyQualified'},
    {'1': 'insurance_seminars_target', '3': 6, '4': 1, '5': 5, '10': 'insuranceSeminarsTarget'},
    {'1': 'insurance_seminars_achieved', '3': 7, '4': 1, '5': 5, '10': 'insuranceSeminarsAchieved'},
    {'1': 'founders_qualified', '3': 8, '4': 1, '5': 8, '10': 'foundersQualified'},
    {'1': 'faith_programs_achieved', '3': 9, '4': 1, '5': 5, '10': 'faithProgramsAchieved'},
    {'1': 'family_programs_achieved', '3': 10, '4': 1, '5': 5, '10': 'familyProgramsAchieved'},
    {'1': 'community_programs_achieved', '3': 11, '4': 1, '5': 5, '10': 'communityProgramsAchieved'},
    {'1': 'life_programs_achieved', '3': 12, '4': 1, '5': 5, '10': 'lifeProgramsAchieved'},
    {'1': 'columbian_qualified', '3': 13, '4': 1, '5': 8, '10': 'columbianQualified'},
    {'1': 'form_185_submitted', '3': 14, '4': 1, '5': 8, '10': 'form185Submitted'},
    {'1': 'form_365_submitted', '3': 15, '4': 1, '5': 8, '10': 'form365Submitted'},
    {'1': 'form_1728_submitted', '3': 16, '4': 1, '5': 8, '10': 'form1728Submitted'},
    {'1': 'safe_environment_compliant', '3': 17, '4': 1, '5': 8, '10': 'safeEnvironmentCompliant'},
    {'1': 'star_council_qualified', '3': 18, '4': 1, '5': 8, '10': 'starCouncilQualified'},
  ],
};

/// Descriptor for `GetStarCouncilStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStarCouncilStatusResponseDescriptor = $convert.base64Decode(
    'ChxHZXRTdGFyQ291bmNpbFN0YXR1c1Jlc3BvbnNlEh0KCmNvdW5jaWxfaWQYASABKAVSCWNvdW'
    '5jaWxJZBIlCg5mcmF0ZXJuYWxfeWVhchgCIAEoBVINZnJhdGVybmFsWWVhchIrChFtZW1iZXJz'
    'aGlwX3RhcmdldBgDIAEoBVIQbWVtYmVyc2hpcFRhcmdldBIvChNtZW1iZXJzaGlwX2FjaGlldm'
    'VkGAQgASgFUhJtZW1iZXJzaGlwQWNoaWV2ZWQSLQoSbWNnaXZuZXlfcXVhbGlmaWVkGAUgASgI'
    'UhFtY2dpdm5leVF1YWxpZmllZBI6ChlpbnN1cmFuY2Vfc2VtaW5hcnNfdGFyZ2V0GAYgASgFUh'
    'dpbnN1cmFuY2VTZW1pbmFyc1RhcmdldBI+ChtpbnN1cmFuY2Vfc2VtaW5hcnNfYWNoaWV2ZWQY'
    'ByABKAVSGWluc3VyYW5jZVNlbWluYXJzQWNoaWV2ZWQSLQoSZm91bmRlcnNfcXVhbGlmaWVkGA'
    'ggASgIUhFmb3VuZGVyc1F1YWxpZmllZBI2ChdmYWl0aF9wcm9ncmFtc19hY2hpZXZlZBgJIAEo'
    'BVIVZmFpdGhQcm9ncmFtc0FjaGlldmVkEjgKGGZhbWlseV9wcm9ncmFtc19hY2hpZXZlZBgKIA'
    'EoBVIWZmFtaWx5UHJvZ3JhbXNBY2hpZXZlZBI+Chtjb21tdW5pdHlfcHJvZ3JhbXNfYWNoaWV2'
    'ZWQYCyABKAVSGWNvbW11bml0eVByb2dyYW1zQWNoaWV2ZWQSNAoWbGlmZV9wcm9ncmFtc19hY2'
    'hpZXZlZBgMIAEoBVIUbGlmZVByb2dyYW1zQWNoaWV2ZWQSLwoTY29sdW1iaWFuX3F1YWxpZmll'
    'ZBgNIAEoCFISY29sdW1iaWFuUXVhbGlmaWVkEiwKEmZvcm1fMTg1X3N1Ym1pdHRlZBgOIAEoCF'
    'IQZm9ybTE4NVN1Ym1pdHRlZBIsChJmb3JtXzM2NV9zdWJtaXR0ZWQYDyABKAhSEGZvcm0zNjVT'
    'dWJtaXR0ZWQSLgoTZm9ybV8xNzI4X3N1Ym1pdHRlZBgQIAEoCFIRZm9ybTE3MjhTdWJtaXR0ZW'
    'QSPAoac2FmZV9lbnZpcm9ubWVudF9jb21wbGlhbnQYESABKAhSGHNhZmVFbnZpcm9ubWVudENv'
    'bXBsaWFudBI0ChZzdGFyX2NvdW5jaWxfcXVhbGlmaWVkGBIgASgIUhRzdGFyQ291bmNpbFF1YW'
    'xpZmllZA==');

