# Create EC2 for Bastion Host
resource "aws_instance" "bastionHost_instance" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.public_ssh.id]
  subnet_id = aws_subnet.public_subnet_az1.id
  key_name = aws_key_pair.tf-key-pairr.id

  tags = {
    Name = "Bastion Host"
  }
  user_data = <<-EOF
              #!/bin/bash
                echo '${tls_private_key.rsa-key.private_key_pem}' > /home/ec2-user/private_key.pem
                chmod 400 private_key.pem
             EOF   
}

# Create EC2 for Application
resource "aws_instance" "application" {
  ami                    = "ami-0c94855ba95c71c99" # Amazon Linux 2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_az2.id
  key_name               = aws_key_pair.tf-key-pairr.id # key
  vpc_security_group_ids = [aws_security_group.private_ssh_3000.id]

  tags = {
    Name = "Application"
  }
}