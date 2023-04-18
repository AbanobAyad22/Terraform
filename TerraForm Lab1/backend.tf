terraform {
  backend "s3" {
    bucket         = "abanob-bucket"
    dynamodb_table = "terraform-Dynamo"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}