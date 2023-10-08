.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

include .env

.PHONY: deploy
deploy: ## Deploy applications
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_LOCAL_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/.env.prd ${SSH_USER}@${HOST_IP}:${PATH_TO_HOST_APP}/.env
	ssh ${SSH_USER}@${HOST_IP} -i ${PATH_TO_LOCAL_PRIVATE_KEY} "cd ${PATH_TO_HOST_APP} && git pull origin master && make docker-compose-build && make docker-compose-up"
