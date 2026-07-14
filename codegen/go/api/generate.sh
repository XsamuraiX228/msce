#!/bin/sh

PACKAGE_PATH=packages/generated/go/api
bundle=$(mktemp --suffix=.yaml)

redocly bundle api/openapi.yaml > $bundle

oapi-codegen \
    --generate types,skip-prune \
    --package api \
    --exclude-schemas Operation \
    -o $PACKAGE_PATH/api.go \
    $bundle

rm $bundle