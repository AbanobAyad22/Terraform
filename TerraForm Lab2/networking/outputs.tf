output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.my_vpc.cidr_block
}
output "pub_sub_1" {
  value = aws_subnet.public_subnet_az1.id
}

output "pub_sub_2" {
  value = aws_subnet.public_subnet_az2.id
}

output "priv_sub_1" {
  value = aws_subnet.private_subnet_az1.id
}

output "priv_sub_2" {
  value = aws_subnet.private_subnet_az2.id
}