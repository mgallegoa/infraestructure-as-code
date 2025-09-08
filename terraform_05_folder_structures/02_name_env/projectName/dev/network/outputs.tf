output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "sg_web_id" {
  value = module.terraform-sg.security_group_id
}
