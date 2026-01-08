//
//  Generated code. Do not modify.
//  source: finance.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionTypeDescriptor instead')
const TransactionType$json = {
  '1': 'TransactionType',
  '2': [
    {'1': 'TRANSACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TRANSACTION_TYPE_INCOME', '2': 1},
    {'1': 'TRANSACTION_TYPE_EXPENSE', '2': 2},
  ],
};

/// Descriptor for `TransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionTypeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblR5cGUSIAocVFJBTlNBQ1RJT05fVFlQRV9VTlNQRUNJRklFRBAAEhsKF1'
    'RSQU5TQUNUSU9OX1RZUEVfSU5DT01FEAESHAoYVFJBTlNBQ1RJT05fVFlQRV9FWFBFTlNFEAI=');

@$core.Deprecated('Use transactionRequestDescriptor instead')
const TransactionRequest$json = {
  '1': 'TransactionRequest',
  '2': [
    {'1': 'council_id', '3': 1, '4': 1, '5': 5, '10': 'councilId'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.kofc.finance.v1.TransactionType', '10': 'type'},
    {'1': 'amount', '3': 3, '4': 1, '5': 11, '6': '.google.type.Money', '10': 'amount'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'check_number', '3': 5, '4': 1, '5': 9, '10': 'checkNumber'},
    {'1': 'linked_member_id', '3': 6, '4': 1, '5': 5, '10': 'linkedMemberId'},
  ],
};

/// Descriptor for `TransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionRequestDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvblJlcXVlc3QSHQoKY291bmNpbF9pZBgBIAEoBVIJY291bmNpbElkEjQKBH'
    'R5cGUYAiABKA4yIC5rb2ZjLmZpbmFuY2UudjEuVHJhbnNhY3Rpb25UeXBlUgR0eXBlEioKBmFt'
    'b3VudBgDIAEoCzISLmdvb2dsZS50eXBlLk1vbmV5UgZhbW91bnQSIAoLZGVzY3JpcHRpb24YBC'
    'ABKAlSC2Rlc2NyaXB0aW9uEiEKDGNoZWNrX251bWJlchgFIAEoCVILY2hlY2tOdW1iZXISKAoQ'
    'bGlua2VkX21lbWJlcl9pZBgGIAEoBVIObGlua2VkTWVtYmVySWQ=');

@$core.Deprecated('Use transactionResponseDescriptor instead')
const TransactionResponse$json = {
  '1': 'TransactionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'transaction_id', '3': 2, '4': 1, '5': 9, '10': 'transactionId'},
  ],
};

/// Descriptor for `TransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionResponseDescriptor = $convert.base64Decode(
    'ChNUcmFuc2FjdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSJQoOdHJhbn'
    'NhY3Rpb25faWQYAiABKAlSDXRyYW5zYWN0aW9uSWQ=');

@$core.Deprecated('Use duesUpdateRequestDescriptor instead')
const DuesUpdateRequest$json = {
  '1': 'DuesUpdateRequest',
  '2': [
    {'1': 'member_id', '3': 1, '4': 1, '5': 5, '10': 'memberId'},
    {'1': 'is_paid', '3': 2, '4': 1, '5': 8, '10': 'isPaid'},
  ],
};

/// Descriptor for `DuesUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List duesUpdateRequestDescriptor = $convert.base64Decode(
    'ChFEdWVzVXBkYXRlUmVxdWVzdBIbCgltZW1iZXJfaWQYASABKAVSCG1lbWJlcklkEhcKB2lzX3'
    'BhaWQYAiABKAhSBmlzUGFpZA==');

@$core.Deprecated('Use duesUpdateResponseDescriptor instead')
const DuesUpdateResponse$json = {
  '1': 'DuesUpdateResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DuesUpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List duesUpdateResponseDescriptor = $convert.base64Decode(
    'ChJEdWVzVXBkYXRlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
