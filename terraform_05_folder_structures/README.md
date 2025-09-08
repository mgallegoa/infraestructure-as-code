# Terraform use of folder structures (terraform_05_folder_structures)

terraform apply -auto-approve

> [!TIP]
> Create a bucket in S3 to share the terraform.tfstate with the team and configure use_lockfile to control the concurrence.

From aws console -->
aws s3api create-bucket \
 --bucket my-terraform-states-bucket \
 --region us-east-1

There are different ways to structure the codes, the most know are:

## 1. Workspaces (01_workspaces) - Drift problem (differences):

This approach is to reduce the duplicity of code, the main idea is have the same code for the different environments using the if/list clauses to distinguish the environment to create/manage:

terraform workspace list
terraform workspace new prod
terraform init
terraform apply

terraform select default
terraform apply (Create new resources for default workspace/profile)

terraform state pull

> ![IMPORTANT] At first glass this is an effective way but is unmanageable for medium and large projects, the backend is the same for different environments and don't reflect the current state of the infrastructure.

## 2. Project Name -> environments -> services (02_name_env):

> [!NOTE] It can be configure to run from a root folder or required to execute terraform apply for every folder

### 2.1. Project Name -> services

    |___ projectName
         |___ s3
              |___ main.tf
              |___ backend.tf //key = projectName/s3/terraform.tfstate
              |___ provider.tf
         |___ dynamodb
              |___ main.tf
              |___ backend.tf //key = projectName/dynamodb/terraform.tfstate
              |___ provider.tf
         |___ lambda
              |___ main.tf
              |___ backend.tf //key = lprojectName/ambda/terraform.tfstate
              |___ provider.tf

### 2.2. Environment -> Project Name -> services

    |___ dev
        |___ projectName1
             |___ s3
                  |___ main.tf
                  |___ backend.tf //key = dev/projectName1/s3/terraform.tfstate
                  |___ provider.tf
             |___ dynamodb
                  |___ main.tf
                  |___ backend.tf //key = dev/projectName1/dynamodb/terraform.tfstate
                  |___ provider.tf
        |___ projectName2
             |___ s3
                  |___ main.tf
                  |___ backend.tf //key = dev/projectName2/s3/terraform.tfstate
                  |___ provider.tf
    |___ prod
        |___ projectName1
             |___ s3
                  |___ main.tf
                  |___ backend.tf //key = prod/projectName1/s3/terraform.tfstate
                  |___ provider.tf
        |___ projectName2
             |___ s3
                  |___ main.tf
                  |___ backend.tf //key = prod/projectName2/s3/terraform.tfstate
                  |___ provider.tf

### 2.3. Environment -> purpose

    |___ dev
        |___ base // Infractructure base for the platform
             |___ aws-mongo-kubernetes // account destinate to kubernates
                    |___ network
                            |___ VPC
                    |___ storage
                            |___ s3
                            |___ dinamodb
             |___ digitalocean // Digital Ocean account
        |___ services // Projects name, for example: products, catalog, stock etc
             |___ products
             |___ catalog
        |___ shared // shared with teams
             |___ jenkis
             |___ sonar
             |___ nexus
    |___ prod
        |___ base // Infractructure base for the platform
             |___ aws-mongo-kubernetes // account destinate to kubernates
                    |___ network
                            |___ VPC
                    |___ storage
                            |___ s3
                            |___ dinamodb
             |___ digitalocean // Digital Ocean account
        |___ services // Projects name, for example: products, catalog, stock etc
             |___ products
             |___ catalog
        |___ shared // shared with teams
             |___ jenkis
             |___ sonar
             |___ nexus

### 2.4. Project Name -> Environment -> services (this approach is simple, by team and environment) - Make sure to execute the network first the other resources

    |___ projectName
            |___ dev
                 |___ s3
                      |___ main.tf
                      |___ backend.tf //key = projectName/dev/s3/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
                 |___ dynamodb
                      |___ main.tf
                      |___ backend.tf //key = projectName/dev/dynamodb/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
                 |___ network
                      |___ main.tf (or modules_network.tf)
                      |___ backend.tf //key = lprojectName/dev/network/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
            |___ prod
                 |___ s3
                      |___ main.tf
                      |___ backend.tf //key = projectName/prod/s3/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
                 |___ dynamodb
                      |___ main.tf
                      |___ backend.tf //key = projectName/prod/dynamodb/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
                 |___ network
                      |___ main.tf
                      |___ backend.tf //key = projectName/prod/network/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf

### 2.5. Use modules + folder structure: Modules and Company -> Project Name -> Environment -> services (Recommended way for large projects) - Make sure to execute the network first the other resources

    |___ Infrastructure
            |___ modules
                    |___ VPC
                    |___ security_groups
                    |___ ec2
            |___ company
                    |___ projectName
                            |___ dev
                                 |___ s3
                                      |___ main.tf
                                      |___ backend.tf //key = company/projectName/dev/s3/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
                                 |___ dynamodb
                                      |___ main.tf
                                      |___ backend.tf //key = company/projectName/dev/dynamodb/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
                                 |___ network
                                      |___ main.tf (or modules_network.tf)
                                      |___ backend.tf //key = company/projectName/dev/network/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
                            |___ prod
                                 |___ s3
                                      |___ main.tf
                                      |___ backend.tf //key = projectName/prod/s3/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
                                 |___ dynamodb
                                      |___ main.tf
                                      |___ backend.tf //key = projectName/prod/dynamodb/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
                                 |___ network
                                      |___ main.tf
                                      |___ backend.tf //key = lprojectName/prod/network/terraform.tfstate
                                      |___ outputs.tf
                                      |___ provider.tf
                                      |___ variables.tf
