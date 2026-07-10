#!/bin/sh

PACKAGE_PATH=packages/generated/python/api
CODEGEN_PATH=codegen/python/api

# Required for package
if [ ! -d "src" ]; then
    mkdir $PACKAGE_PATH/src
endif

# Generating models
redocly bundle api/openapi.yaml | \
datamodel-codegen \
	--output $PACKAGE_PATH/src/__init__.py \
	--input-file-type openapi \
	--formatters builtin

# Creating pyproject.toml
cp $CODEGEN_PATH/pyproject.toml $PACKAGE_PATH