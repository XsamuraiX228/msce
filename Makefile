.PHONY: generate-models generate-models-python

generate-models-python:
	datamodel-codegen \
		--input api/openapi.yaml \
		--output packages/models/python/models.py \
		--input-file-type openapi \
		--formatters builtin

generate-models-rust:
	openapi-generator-cli generate \
		-i api/openapi.yaml \
		-g rust \
		-o packages/models/rust \
		--global-property models

generate-models: generate-models-python generate-models-rust
