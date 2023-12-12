#Prod
# Name prefix
variable "prefix" {
  type        = string
  default     = "Group5"
  description = "Name prefix"
}

# VPC CIDR range
variable "vpc_cidr" {
  default     = "10.1.0.0/16"
  type        = string
  description = "VPC to for the prod env"
}

# Provision public subnets in custom VPC
variable "public_cidr_subnets" {
  default     = ["10.1.1.0/24", "10.1.2.0/24","10.1.3.0/24","10.1.4.0/24"]
  type        = list(string)
  description = "Subnets CIDRs"
}

# Provision private subnets in custom VPC
variable "private_cidr_subnets" {
  default     = ["10.1.5.0/24", "10.1.6.0/24"]
  type        = list(string)
  description = "Subnets CIDRs"
}