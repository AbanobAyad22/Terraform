# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.CIDR

  tags = {
    Name = "${var.NAME}_vpc"
  }
}