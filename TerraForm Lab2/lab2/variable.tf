variable "VPC_CIDR" {
  type = string 
  default = "10.0.0.0/16"
}

variable "COMPANY_NAME" {
  type = string 
}

variable "PUBLIC_SUBNET_1_CIDR" {
  type = string 
  default = "10.0.1.0/24"
}

variable "PUBLIC_SUBNET_2_CIDR" {
  type = string 
  default = "10.0.2.0/24"
}

variable "PRIVATE_SUBNET_3_CIDR" {
  type = string 
  default = "10.0.3.0/24"
}

variable "PRIVATE_SUBNET_4_CIDR" {
  type = string 
  default = "10.0.4.0/24"
}


variable "az_1" {
  type = string 
}

variable "az_2" {
  type = string 
}

variable "REGION"{
    type = string 
}

variable "AMI"{
    type = string 
}

variable "INSTANCE_TYPE"{
    type = string 
}


