SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

build-git-arch:
	@docker image build \
		--tag "dpe/git:arch" \
		--file "$(shell pwd)/git/Dockerfile" \
		"$(shell pwd)/git"

build-tmux-arch: build-git-arch
	@docker image build \
		--tag "dpe/tmux:arch" \
		--file "$(shell pwd)/tmux/Dockerfile" \
		"$(shell pwd)/tmux"

build-base-arch: build-tmux-arch
	@docker image build \
		--tag "dpe/base:arch" \
		--file "$(shell pwd)/base/Dockerfile" \
		"$(shell pwd)/base"
