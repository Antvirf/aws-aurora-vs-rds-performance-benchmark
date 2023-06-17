.PHONY: init apply

init:
	terraform init

apply:
	terraform apply -var-file=config.tfvars