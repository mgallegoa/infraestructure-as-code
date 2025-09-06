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
  instanse_tag = "Tag name from variable in locals"
}

resource "aws_instance" "basic_example" {
  for_each = var.ec2_instances_name

  ami                         = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type               = "t3.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.terraform-sg.security_group_id]
  associate_public_ip_address = true

  tags = {
    ExtraTag = local.instanse_tag
    Name     = "EC2_${each.key}"
  }
}

resource "aws_cloudwatch_log_group" "ec2_instances_log_group" {
  for_each = var.ec2_instances_name
  tags = {
    Environment = "test"
    Service     = each.key
  }
  lifecycle {
    create_before_destroy = true
  }
}
