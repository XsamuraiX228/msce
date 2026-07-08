.PHONY: generate-models generate-models-python

generate-models-python:
	./codegen/models/python/generate.sh

generate-models-rust:
	openapi-generator-cli generate \
		-i api/openapi.yaml \
		-g rust \
		-o packages/generated/rust/models \
		--global-property models \
		--skip-validate-spec

generate-models: generate-models-python generate-models-rust
