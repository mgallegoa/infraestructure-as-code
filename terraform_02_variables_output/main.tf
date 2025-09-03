terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
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
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t3.micro"
  tags = {
    ExtraTag = local.instanse_tag
  }
}
