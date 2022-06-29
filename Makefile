SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

build-tmux-bionic: build-git-bionic
	@docker image build \
		--tag "tmux:bionic" \
		--file "$(shell pwd)/tmux/Dockerfile" \
		"$(shell pwd)/tmux"

build-git-bionic:
	@docker image build \
		--tag "git:bionic" \
		--file "$(shell pwd)/git/Dockerfile" \
		"$(shell pwd)/git"

build-base-bionic: build-tmux-bionic
	@docker image build \
		--tag "base:bionic" \
		--file "$(shell pwd)/base/Dockerfile" \
		"$(shell pwd)/base"
