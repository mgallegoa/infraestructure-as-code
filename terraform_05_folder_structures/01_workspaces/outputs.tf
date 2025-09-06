output "instance_ip_private" {
  value = { for service, i in aws_instance.basic_example : service => format("%s - %s", terraform.workspace, i.private_ip) }
}
