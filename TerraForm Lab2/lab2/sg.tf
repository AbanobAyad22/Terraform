# Create Security Group for SSH Access from Anywhere open to all
resource "aws_security_group" "public_ssh" {
  name_prefix = "public_ssh"
  description = "Allow SSH Access from Anywhere"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 
  
}


# Create Security Group for SSH and Port 3000 from VPC CIDR
resource "aws_security_group" "private_ssh_3000" {
  name_prefix = "private_ssh_3000"
  description = "Allow SSH and Port 3000 from VPC CIDR"
  vpc_id      = module.my_network.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.my_network.vpc_cidr]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.my_network.vpc_cidr]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


}


# Create a security group for RDS
resource "aws_security_group" "rds_security_group" {
  name_prefix = "rds_sg_"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [module.my_network.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for Elasticache
resource "aws_security_group" "elasticache_security_group" {
  name_prefix = "elasticache_sg_"
  vpc_id      = module.my_network.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [module.my_network.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
