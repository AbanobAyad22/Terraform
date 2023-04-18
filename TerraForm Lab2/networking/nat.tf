resource "aws_nat_gateway" "iti_NG" {
  allocation_id = aws_eip.iti_eip.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.NAME}_NG"
  }

  depends_on = [aws_internet_gateway.my_igw]
}

resource "aws_eip" "iti_eip" {
  vpc = true
  tags = {
    Name = "${var.NAME}_eip"
  }
}


