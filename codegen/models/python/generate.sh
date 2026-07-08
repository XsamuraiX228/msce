#!/bin/sh

PACKAGE_PATH=packages/generated/python/models
CODEGEN_PATH=codegen/models/python

# Generating models
redocly bundle api/openapi.yaml | \
datamodel-codegen \
	--output ${PACKAGE_PATH}/models.py \
	--input-file-type openapi \
	--formatters builtin

# Creating pyproject.toml
cp ${CODEGEN_PATH}/pyproject.toml ${PACKAGE_PATH}