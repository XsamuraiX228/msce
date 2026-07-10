.PHONY: generate-models generate-models-python

generate-models-python:
	./codegen/models/python/generate.sh

generate-models-rust:
	./codegen/models/rust/generate.sh

generate-models: generate-models-python generate-models-rust
