# Terraform use of folder structures (terraform_05_folder_structures)

terraform apply -auto-approve

There are different ways to structure the codes, the most know are:

## 1. Workspaces (01_workspaces):

This approach is to reduce the duplicity of code, the main idea is have the same code for the different environments using the if/list clauses to distinguish the environment to create/manage:

terraform workspace list
terraform workspace new prod

> ![IMPORTANT] At first glass this is an effective way but is unmanageable for medium and large projects, the backend is the same for different environments and don't reflect the current state of the infrastructure.

## 2.
