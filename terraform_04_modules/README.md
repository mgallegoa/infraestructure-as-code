# Terraform use of Modules (terraform_04_modules)

terraform apply -auto-approve

Use the Terraform registry for the module: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest?tab=resources

This example use set, for_each to create 3 ec2 instances and create Logs in CloudWatch using the terraform.tfvars file to create the services, for example create the variable:

ec2_instances_name = ["ec2_service_1", "ec2_service_2", "ec2_service_3"]

## Diagram

![Diagram for the infrastructure](https://github.com/mgallegoa/infraestructure-as-code/blob/main/terraform_04_modules/04_modules_aws_createVPCandEC2Instances.jpg?raw=true "Infrastructure diagram")

## Support, buy me a coffee:

[Go to buy me a coffee](https://buymeacoffee.com/manuelarias)
