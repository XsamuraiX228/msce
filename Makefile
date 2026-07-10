.PHONY: generate-models generate-models-python

generate-api-python:
	@./codegen/python/api/generate.sh >/dev/null

generate-api-rust:
	@./codegen/rust/api/generate.sh >/dev/null

generate-api: generate-api-python generate-api-rust
