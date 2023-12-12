#Module
# Prefix to identify resources
# Default tags
variable "default_tags" {
  default = {
    "Owner" = "ACS730-Group8",
    "App"   = "Web Application",
    "Course" = "ACS730"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

variable "prefix" {
  #default     = "week7"
  type        = string
  description = "Name prefix"
}

# VPC CIDR range
variable "vpc_cidr" {
#  default     = "10.1.0.0/16"
  type        = string
  description = "VPC that needs to be deployed"
}

# Provision public subnets in custom VPC
variable "public_cidr_subnets" {
#  default     = ["10.1.1.0/24", "10.1.2.0/24"]
  type        = list(string)
  description = "Subnets CIDRs"
}

# Provision private subnets in custom VPC
variable "private_cidr_subnets" {
#  default     = ["10.1.1.0/24", "10.1.2.0/24"]
  type        = list(string)
  description = "Subnets CIDRs"
}