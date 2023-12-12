# Module to deploy basic networking 
module "vpc-prod" {
  source = "../modules/aws_network"
  #source             = "github.com/Dhansca/acsnwmodule.git"
  #env                = var.env
  prefix             = var.prefix
  vpc_cidr           = var.vpc_cidr
  public_cidr_subnets = var.public_cidr_subnets
  private_cidr_subnets = var.private_cidr_subnets

#  default_tags       = var.default_tags
}