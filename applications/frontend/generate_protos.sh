#!/bin/bash
# Create output directory
mkdir -p lib/src/generated

# Generate Dart code
protoc --dart_out=grpc:lib/src/generated \
  -I../../protos \
  ../../protos/activity.proto \
  ../../protos/finance.proto \
  ../../protos/membership.proto \
  ../../protos/google/type/money.proto \
  ../../protos/google/protobuf/timestamp.proto
