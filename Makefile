.PHONY: generate-api-python generate-api-rust generate-api-go generate-api

generate-api-python:
	@./codegen/python/api/generate.sh >/dev/null

generate-api-rust:
	@./codegen/rust/api/generate.sh >/dev/null

generate-api-go:
	@./codegen/go/api/generate.sh >/dev/null

generate-api: generate-api-python generate-api-rust generate-api-go
