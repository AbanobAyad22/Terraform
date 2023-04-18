# Create EC2 for Bastion Host
resource "aws_instance" "bastionHost_instance" {
  ami           = var.AMI
  # ami           = "ami-0c94855ba95c71c99"
  instance_type = var.INSTANCE_TYPE
  # instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.public_ssh.id]
  subnet_id = module.my_network.pub_sub_1
  key_name = aws_key_pair.tf-key-pairr.id
  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }

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
  ami           = var.AMI
  # ami           = "ami-0c94855ba95c71c99"
  instance_type = var.INSTANCE_TYPE
  # instance_type = "t2.micro"
  subnet_id              = module.my_network.priv_sub_2
  key_name               = aws_key_pair.tf-key-pairr.id # key
  vpc_security_group_ids = [aws_security_group.private_ssh_3000.id]

  tags = {
    Name = "Application"
  }
}