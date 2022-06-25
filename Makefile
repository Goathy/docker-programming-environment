SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

build-git-bionic:
	@docker image build \
		--tag "git:bionic" \
		--file $(shell pwd)/git/Dockerfile \
		"$(shell pwd)/git"

build-base:
	@docker image build \
		--progress="plain" \
		--tag "base:latest" \
		--file "$(shell pwd)/Dockerfile.base" \
		"$(shell pwd)"
