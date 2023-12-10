provider "aws" {
region  = var.region
}


terraform {
  backend "s3" {
    bucket = "group5lsfathima"            // Bucket from where to GET Terraform State
    key    = "network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                       // Region where bucket created
  }
}