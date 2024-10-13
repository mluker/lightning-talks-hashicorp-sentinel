# Purpose of this repository

This repository is a simple example of how to use Sentinel with Terraform. It contains a simple Terraform configuration that represents a few resources and validates the Terraform plan using Sentinel policies. 

## What is Sentinel

Sentinel is a policy as code tool that lets you control what users of HashiCorp products are allowed to do. It enforces policies proactively, preventing end users from deploying changes that are not allowed.

Sentinel policies are text files written using the Sentinel language. The policies are evaluated top-to-bottom. The value of main after execution determines whether a policy passes or fails.

Resources:
* Docs: https://developer.hashicorp.com/sentinel?ajs_aid=3975cddd-bb64-495a-ab06-df18b7752b75
* Playground: https://play.sentinelproject.io/
* Imports: https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/sentinel/import/tfconfig-v2

## Getting started:

1. Start the devcontainer
1. Run the following commands:
    ```bash
    az login
    az account show --query id --output tsv
1. Set the `azure_subscription_id` with the value from the previous step variable in terraform.tfvars
1. Run the following commands:
    ```bash
    cd ./terraform
    terraform init
    terraform plan -out=tfplan.plan && terraform show -json ./tfplan.plan > tfplan.json
    ```
1. Run the following command to test the Sentinel policy:
    ```bash
    cd ../sentinel
    sentinel apply
    ```