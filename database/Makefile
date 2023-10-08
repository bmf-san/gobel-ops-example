.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

include .env

.PHONY: download-backup-sql
download-backup-sql: ## Run download a backup.sql
	rsync -vz -e "ssh -p ${SSH_PORT} -i ${PATH_TO_LOCAL_PRIVATE_KEY}" ${SSH_USER}@${HOST_IP}:${PATH_TO_HOST_FILE} ${PATH_TO_LOCAL_FILE}/gobel_${shell date '+%Y-%m-%d'}.sql
