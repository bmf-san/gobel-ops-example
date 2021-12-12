.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
ansible_host=$(shell grep "ansible_host" ./inventories/hosts | awk '{print $$2}' | sed 's/ansible_host=//g')

.PHONY: init-provision
init-provision: ## Run ansible-playbook for initilization
	ansible-playbook ./init.yml -i ./inventories/hosts -e "ansible_host=$(ansible_host) ansible_ssh_user=root"

.PHONY: provision
provision: ## Run ansible-playbook
	ansible-playbook ./site.yml -i ./inventories/hosts --ask-become-pass