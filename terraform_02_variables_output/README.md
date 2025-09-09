# Terraform use of Variables and output (terraform_02_variables_output)

terraform apply -auto-approve

## Different way and priority to declare variables

1. When execute "terraform apply", the console request for the var.name_var
2. Use Default in the definition of the variables default="This is a default tag"
3. Environment vars, create the variables with name start with TF_VAR , example: TF\*VAR_variableName
4. Create the file terraform.tfvars or terraform.json
5. Create a file with a name different to terraform, for example otherVariables.tfvars load using -var-file=./otherVariables.tfvars
6. With .auto.tfvars or .auto.tfvars.json is loaded by default, for example otherVariables.auto.tfvars
7. Load variables using flags -var and -var-file, example terraform apply -var myvariable=hellow

## Diagram

![Diagram for the infrastructure](https://github.com/mgallegoa/infraestructure-as-code/blob/main/terraform_02_variables_output/02_variables_output_aws_createEC2Instance.jpg?raw=true "Infrastructure diagram")

## Support, buy me a coffee:

[Go to buy me a coffee](https://buymeacoffee.com/manuelarias)
