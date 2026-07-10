#!/bin/sh

PACKAGE_PATH=packages/generated/rust/api

bundle=$(mktemp --suffix=.yaml)

# Generating models
redocly bundle api/openapi.yaml > $bundle
omg \
    --input $bundle \
    --output $PACKAGE_PATH \
    --mode models

# Changing from module to library
mv $PACKAGE_PATH/models.rs $PACKAGE_PATH/lib.rs
rm $PACKAGE_PATH/mod.rs