.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: fmt
fmt: ## Run terraform fmt
	terraform fmt -recursive

.PHONY: init
init: ## Run terraform init
	terraform init

.PHONY: validate
validate: ## Run terraform validate
	find . -type f -name '*.tf' -exec dirname {} \; | sort -u | \
	xargs -I {} terraform validate {}
	
.PHONY: plan
plan: ## Run terraform plan
	terraform plan

.PHONY: apply
apply: ## Run terraform destroy.
	terraform apply

.PHONY: destroy
destroy: ## Run terraform destroy.
	terraform destroy
