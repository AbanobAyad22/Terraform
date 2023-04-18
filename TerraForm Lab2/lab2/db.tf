# Create RDS subnet group
resource "aws_db_subnet_group" "example_rds_subnet_group" {
  name       = "example-rds-subnet-group"
  subnet_ids = [module.my_network.priv_sub_1, module.my_network.priv_sub_2]
}

# Create RDS instance
resource "aws_db_instance" "RdsDb" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  db_name           = "rdsTerraform"
  username               = "dbadmin"
  password               = "passwd123"

  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  db_subnet_group_name   = aws_db_subnet_group.example_rds_subnet_group.id
}

