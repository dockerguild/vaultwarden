-include .env
-include .env.local
export

SUDO=$(shell sh -c "if [ 0 != $EUID ]; then echo 'sudo'; fi")

-include ./.make/docker
-include ./.make/filesystem
-include ./.make/git

## ----------------------------------------------------------
## Main
## ----------------------------------------------------------
.PHONY: install update start restart down

install:
	make docker/start

update:
	make docker/down
	make git/update
	make docker/start

start:
	make docker/start

restart:
	make docker/restart

down:
	make docker/down

dump:
	make filesystem/dump
