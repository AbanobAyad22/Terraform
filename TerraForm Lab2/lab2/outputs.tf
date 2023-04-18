output "inventory_ip" {
  value = aws_instance.bastionHost_instance.public_ip
}