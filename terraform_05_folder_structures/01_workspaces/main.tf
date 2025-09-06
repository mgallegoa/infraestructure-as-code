terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# Other way to define variables. To define variables in local file.
locals {
  environment_name = terraform.workspace
}

resource "aws_instance" "basic_example" {
  count = terraform.workspace == "prod" ? 2 : 1

  ami                         = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type               = "t3.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.terraform-sg.security_group_id]
  associate_public_ip_address = true

  tags = {
    env  = terraform.workspace
    name = format("EC2-%s-%s", terraform.workspace, count.index)
  }
}
