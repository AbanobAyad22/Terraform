resource "aws_nat_gateway" "iti_NG" {
  allocation_id = aws_eip.iti_eip.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "iti_NG"
  }

  depends_on = [aws_internet_gateway.my_igw]
}

resource "aws_eip" "iti_eip" {
  vpc = true
  tags = {
    Name = "iti_eip"
  }
}


