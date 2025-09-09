# infraestructure-as-code learn how to work with Terraform and others tools

               ███╗░░░███╗░█████╗░███╗░░██╗██╗░░░██╗███████╗██╗░░░░░
               ████╗░████║██╔══██╗████╗░██║██║░░░██║██╔════╝██║░░░░░
               ██╔████╔██║███████║██╔██╗██║██║░░░██║█████╗░░██║░░░░░
               ██║╚██╔╝██║██╔══██║██║╚████║██║░░░██║██╔══╝░░██║░░░░░
               ██║░╚═╝░██║██║░░██║██║░╚███║╚██████╔╝███████╗███████╗
               ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚═════╝░╚══════╝╚══════╝

This repository contain script and documentation using Terraform, CloudFormation, etc to manage infrastructure

## Terraform

Install Terraform from the official web page and start using the command: terraform init.

1. terraform_01_basic: folder with the script in terraform to install and run the first amazon ec2 instance
2. terraform_02_variables_output: Explain and show how to use variables in terraform and how to output work.
3. terraform_03_functions : Explain and show how to use functions in terraform and documented the list of functions. This example create 3 ec2 instances and assign the cloudwatch logs for each instances.
4. terraform_04_modules : Explain and show how to configure a network and instances using Terraform modules
5. terraform_05_folder_structures : Explain and show how to organize the files in big companies to increase the man tenability. This example show how to create a S3 bucket to store the state of the infrastructure to share between the teams.

> [!TIP]
> The recommended approach for big companies are mixed, using modules for the generic setup (like VPCs) and folder by project for the specific projects.

## Diagram for folder structure

![Diagram for the infrastructure](https://github.com/mgallegoa/infraestructure-as-code/blob/main/terraform_05_folder_structures/05_folder_structures_aws_createVPCandEC2Instance.jpg?raw=true "Infrastructure diagram")

## Support by me a coffee:

[Go to by me a coffee](https://buymeacoffee.com/manuelarias)
