.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

include .env

.PHONY: Build containers
deploy: ## Deploy applications
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/elasticsearch/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/elasticsearch/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/gobel-api/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/gobel-api/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/gobel-client-example/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/gobel-client-example/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/grafana/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/grafana/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/mysql/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/mysql/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/mysqld-exporter/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/mysqld-exporter/.env
	rsync -avz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_PRIVATE_KEY}" ${PATH_TO_LOCAL_APP}/redis/.env ${SSH_USER}@${HOST_IP}:${PATH_TO_APP}/redis/.env
	ssh ${SSH_USER}@${HOST_IP} -i ${PATH_TO_PRIVATE_KEY} "cd ${PATH_TO_APP} && git pull origin master && make docker-create-network && make docker-compose-up"
