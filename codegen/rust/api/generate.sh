#!/bin/sh

PACKAGE_PATH=packages/generated/rust/api
CODEGEN_PATH=codegen/rust/api

bundle=$(mktemp --suffix=.yaml)

# Creating package path if not present
mkdir -p $PACKAGE_PATH/src

# Generating models
redocly bundle api/openapi.yaml > $bundle
omg \
    --input $bundle \
    --output $PACKAGE_PATH/src \
    --mode models

# Changing from module to library
mv $PACKAGE_PATH/src/models.rs $PACKAGE_PATH/src/lib.rs
rm $PACKAGE_PATH/src/mod.rs

# Creating Cargo.toml
cp $CODEGEN_PATH/Cargo.toml $PACKAGE_PATH