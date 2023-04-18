# Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}



# Create Private Subnet for A-Z 1
resource "aws_subnet" "private_subnet_az1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.PRIVATE_3_CIDR
  availability_zone = var.azo_1

  tags = {
    Name = "Private Subnet - Availability Zone 1"
  }
}

# Create Private Subnet for A-Z 2
resource "aws_subnet" "private_subnet_az2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.PRIVATE_4_CIDR
  availability_zone = var.azo_2

  tags = {
    Name = "Private Subnet - Availability Zone 2"
  }
}

# Associate Private Route Table with Private Subnets
resource "aws_route_table_association" "private_subnet_az1_association" {
  subnet_id      = aws_subnet.private_subnet_az1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_az2_association" {
  subnet_id      = aws_subnet.private_subnet_az2.id
  route_table_id = aws_route_table.private_route_table.id
}