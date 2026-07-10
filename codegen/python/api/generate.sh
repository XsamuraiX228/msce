#!/bin/sh

PACKAGE_PATH=packages/generated/python/api
CODEGEN_PATH=codegen/python/api

# Generating models
redocly bundle api/openapi.yaml | \
datamodel-codegen \
	--output $PACKAGE_PATH/__init__.py \
	--input-file-type openapi \
	--formatters builtin

# Creating pyproject.toml
cp $CODEGEN_PATH/pyproject.toml $PACKAGE_PATH