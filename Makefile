SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

build-git:
	@docker image build \
		--no-cache \
		--tag "dpe/git:latest" \
		--file "$(shell pwd)/git/Dockerfile" \
		"$(shell pwd)/git"

build-tmux: build-git
	@docker image build \
		--no-cache \
		--tag "dpe/tmux:latest" \
		--file "$(shell pwd)/tmux/Dockerfile" \
		"$(shell pwd)/tmux"

build-base: build-tmux
	@docker image build \
		--no-cache \
		--tag "dpe/base:latest" \
		--file "$(shell pwd)/base/Dockerfile" \
		"$(shell pwd)/base"

build-node18: build-base
	@docker image build \
		--no-cache \
		--build-arg "NODE_VERSION=18.13.0" \
		--build-arg "YARN_VERSION=1.22.19" \
		--build-arg "ARCH=x64" \
		--tag "dpe/node:18" \
		--file "$(shell pwd)/node/Dockerfile" \
		"$(shell pwd)/node"

build-node19: build-base
	@docker image build \
		--no-cache \
		--build-arg "NODE_VERSION=19.5.0" \
		--build-arg "YARN_VERSION=1.22.19" \
		--build-arg "ARCH=x64" \
		--tag "dpe/node:19" \
		--file "$(shell pwd)/node/Dockerfile" \
		"$(shell pwd)/node"

build-golang1.19: build-base
	@docker image build \
		--no-cache \
		--build-arg "VERSION=1.19.5" \
		--tag "dpe/golang:1.19" \
		--file "$(shell pwd)/golang/Dockerfile" \
		"$(shell pwd)/golang"


build-python3.11: build-base
	@docker image build \
		--no-cache \
		--build-arg "VERSION=3.11.1" \
		--tag "dpe/python:3.11" \
		--file "$(shell pwd)/python/Dockerfile" \
		"$(shell pwd)/python"
