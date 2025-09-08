# Terraform recommended folder structures

This infrastructure is organized in the recommended way for large projects.

terraform apply -auto-approve

> [!TIP]
> Create a bucket in S3 to share the terraform.tfstate with the team and configure use_lockfile to control the concurrence.

From aws console -->
aws s3api create-bucket \
 --bucket my-terraform-states-bucket \
 --region us-east-1

## 2.4. Project Name -> Environment -> services (This is the recommended way, simple, by team and environment) - Make sure to execute the network first the other resources

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
                      |___ backend.tf //key = lprojectName/prod/network/terraform.tfstate
                      |___ outputs.tf
                      |___ provider.tf
                      |___ variables.tf
