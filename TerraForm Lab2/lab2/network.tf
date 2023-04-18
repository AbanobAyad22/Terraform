module "my_network" {
  source = "../networking"
  CIDR = var.VPC_CIDR
  NAME = var.COMPANY_NAME
  azo_1 = var.az_1
  azo_2 = var.az_2
  PUBLIC_1_CIDR =  var.PUBLIC_SUBNET_1_CIDR
  PUBLIC_2_CIDR = var.PUBLIC_SUBNET_2_CIDR
  PRIVATE_3_CIDR = var.PRIVATE_SUBNET_3_CIDR
  PRIVATE_4_CIDR = var.PRIVATE_SUBNET_4_CIDR
}