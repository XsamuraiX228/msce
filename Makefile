.PHONY: generate-models generate-models-python

generate-models-python:
	datamodel-codegen \
		--input api/openapi.yaml \
		--output packages/models/python/models.py \
		--input-file-type openapi \
		--formatters builtin

generate-models: generate-models-python
