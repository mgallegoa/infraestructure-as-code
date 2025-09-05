# Terraform use of Modules (terraform_04_modules)

terraform apply -auto-approve

Use the Terraform registry for the module: https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest?tab=resources

This example use set, for_each to create 3 ec2 instances and create Logs in CloudWatch using the terraform.tfvars file to create the services, for example create the variable:

ec2_instances_name = ["ec2_service_1", "ec2_service_2", "ec2_service_3"]

## Collection types

- list
- map
- set

## Built-In Functions

- numeric: abs, floor, log
- string
  - chomp: removes newline characters
  - format: format(”Hello, %s!”, “Ander”) → Hello Ander!
  - formatlist
  - indent
  - join
  - lower
  - regex
  - regexall
  - replace
  - split
  - strrev
  - substr
  - Title
  - trimprefix
  - trimsuffix
  - trimspace
  - upper
  ### Collection Functions
  - alltrue
  - anytrue
  - chuncklist
  - coalesce → returns the first no null object
  - coalescelist
  - compact → removes empty strings from a list
  - concat
  - contains
  - distinct → deduplicate
  - element → get element by index
  - index → returns the index of an element
  - flatten → merge list of list into a unique list
  - keys → takes a map and returns a list containing the keys from that map
  - length
  - lookup:
    - lookup({a=”ay”, b=”bee”},”a”,”what?”)→ ay
    - lookup({a=”ay”, b=”bee”},”c”,”what?”)→ what?
  - merge: merges elements
  - one
  - range
  - reverse
  - setintersection
  - setproduct
  - setsubtract
  - setunion
  - slice
  - sort
  - sum
  - transpose
  - values
  - zipmap
