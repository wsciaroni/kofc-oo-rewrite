#!/bin/bash
# Create output directory
mkdir -p lib/src/generated

# Generate Dart code
protoc --dart_out=grpc:lib/src/generated -I../../protos ../../protos/*.proto ../../protos/google/type/*.proto ../../protos/google/protobuf/*.proto
