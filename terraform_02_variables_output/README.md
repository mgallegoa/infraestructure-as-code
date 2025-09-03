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
