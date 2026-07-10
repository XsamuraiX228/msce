#!/bin/sh

PACKAGE_PATH=packages/generated/python/api
CODEGEN_PATH=codegen/python/api

# Creating package path if not present
mkdir -p $PACKAGE_PATH/api

# Generating models
redocly bundle api/openapi.yaml | \
datamodel-codegen \
	--output $PACKAGE_PATH/api/__init__.py \
	--input-file-type openapi \
	--formatters builtin

# Creating pyproject.toml
cp $CODEGEN_PATH/pyproject.toml $PACKAGE_PATH