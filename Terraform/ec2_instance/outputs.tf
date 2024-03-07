
output "public_ip" {
  value = aws_instance.centos_instance.public_ip
}