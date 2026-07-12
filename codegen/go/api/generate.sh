#!/bin/sh

PACKAGE_PATH=packages/generated/go/api
# CODEGEN_PATH=codegen/go/api
bundle=$(mktemp --suffix=.yaml)

redocly bundle api/openapi.yaml > $bundle

oapi-codegen \
    --generate types \
    --package api \
    -include-operation-ids divide \
    -o $PACKAGE_PATH/api.go \
    $bundle

rm $bundle