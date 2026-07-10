#!/bin/sh

PACKAGE_PATH=packages/generated/rust/models/src

bundle=$(mktemp --suffix=.yaml)
echo $bundle
redocly bundle api/openapi.yaml > $bundle

omg \
    --input $bundle \
    --output $PACKAGE_PATH \
    --mode models

cp $PACKAGE_PATH/mod.rs $PACKAGE_PATH/lib.rs
rm $PACKAGE_PATH/mod.rs
rm $bundle