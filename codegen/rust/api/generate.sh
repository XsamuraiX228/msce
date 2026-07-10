#!/bin/sh

PACKAGE_PATH=packages/generated/rust/api
CODEGEN_PATH=codegen/rust/api

bundle=$(mktemp --suffix=.yaml)

# Required for package
if [ ! -d "src" ]; then
    mkdir $PACKAGE_PATH/src
endif

# Generating models
redocly bundle api/openapi.yaml > $bundle
omg \
    --input $bundle \
    --output $PACKAGE_PATH/src \
    --mode models

# Changing from module to library
mv $PACKAGE_PATH/src/models.rs $PACKAGE_PATH/src/lib.rs
rm $PACKAGE_PATH/mod.rs

# Creating Cargo.toml
cp $CODEGEN_PATH/Cargo.toml $PACKAGE_PATH