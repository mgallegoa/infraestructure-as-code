output "instance_ip_private" {
  # value = aws_instance.basic_example.private_ip
  value = { for service, i in aws_instance.basic_example : service => i.private_ip }
}
