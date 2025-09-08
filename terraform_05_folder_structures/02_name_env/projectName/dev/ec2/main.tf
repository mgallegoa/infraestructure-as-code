# Other way to define variables. To define variables in local file.
locals {
  instanse_tag = "Tag name from variable in locals"
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform.state.manuel.fernando.arias.marin"
    key    = "projectName/dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "basic_example" {
  for_each = var.ec2_instances_name

  ami                         = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type               = "t3.micro"
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnets[0]
  vpc_security_group_ids      = [data.terraform_remote_state.network.outputs.sg_web_id]
  associate_public_ip_address = true

  tags = {
    ExtraTag = local.instanse_tag
    Name     = "EC2_${each.key}"
  }
}
