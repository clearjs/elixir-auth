#!/bin/bash

PROTOS=("
    priv/protos/google/api/annotations.proto
    priv/protos/google/api/http.proto
    priv/protos/google/protobuf/any.proto
    priv/protos/google/protobuf/descriptor.proto
    priv/protos/google/protobuf/duration.proto
    priv/protos/google/protobuf/empty.proto
    priv/protos/google/protobuf/field_mask.proto
    priv/protos/google/protobuf/struct.proto
    priv/protos/google/protobuf/timestamp.proto
    priv/protos/google/protobuf/wrappers.proto
    priv/protos/google/pubsub/v1/pubsub.proto
")

rm -rf ./lib/google/*

for file in $PROTOS; do
    protoc -I ./priv/protos/ --elixir_out=plugins=grpc:./lib $file
done
