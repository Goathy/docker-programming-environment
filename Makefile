SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

build-git-arch:
	@docker image build \
		--no-cache \
		--tag "dpe/git:arch" \
		--file "$(shell pwd)/git/Dockerfile" \
		"$(shell pwd)/git"

build-tmux-arch: build-git-arch
	@docker image build \
		--no-cache \
		--tag "dpe/tmux:arch" \
		--file "$(shell pwd)/tmux/Dockerfile" \
		"$(shell pwd)/tmux"

build-base-arch: build-tmux-arch
	@docker image build \
		--no-cache \
		--tag "dpe/base:arch" \
		--file "$(shell pwd)/base/Dockerfile" \
		"$(shell pwd)/base"

build-node14-arch: build-base-arch
	@docker image build \
		--no-cache \
		--build-arg "NODE_VERSION=14.20.1" \
		--build-arg "YARN_VERSION=1.22.19" \
		--build-arg "ARCH=x64" \
		--tag "dpe/node14:arch" \
		--file "$(shell pwd)/node/Dockerfile" \
		"$(shell pwd)/node"

build-node16-arch: build-base-arch
	@docker image build \
		--no-cache \
		--build-arg "NODE_VERSION=16.17.1" \
		--build-arg "YARN_VERSION=1.22.19" \
		--build-arg "ARCH=x64" \
		--tag "dpe/node16:arch" \
		--file "$(shell pwd)/node/Dockerfile" \
		"$(shell pwd)/node"

build-node18-arch: build-base-arch
	@docker image build \
		--no-cache \
		--build-arg "NODE_VERSION=18.11.0" \
		--build-arg "YARN_VERSION=1.22.19" \
		--build-arg "ARCH=x64" \
		--tag "dpe/node18:arch" \
		--file "$(shell pwd)/node/Dockerfile" \
		"$(shell pwd)/node"

build-golang1.19-arch: build-base-arch
	@docker image build \
		--no-cache \
		--build-arg "VERSION=1.19.1" \
		--tag "dpe/golang1.19:arch" \
		--file "$(shell pwd)/golang/Dockerfile" \
		"$(shell pwd)/golang"


build-python3.11-arch: build-base-arch
	@docker image build \
		--no-cache \
		--progress "plain" \
		--build-arg "VERSION=3.11.1" \
		--tag "dpe/python3.11:arch" \
		--file "$(shell pwd)/python/Dockerfile" \
		"$(shell pwd)/python"