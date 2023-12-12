variable "instance_type" {
  default     = "t3.micro"
  description = "type of the ec2 instance"
  type        = string
}

# Step 8 - Add variables
variable "default_tags" {
  default = {
    "Owner" = "Group5",
    "App"   = "Final Project",
    "Course" = "ACS730"
    "Env"   = "Prod"
  }
  type        = map(any)
  description = "Default tags to be appliad to all AWS resources"
}

# Step 8 - Add variables
variable "prefix" {
  default     = "group5"
  type        = string
  description = "Name prefix"
}
variable "path_to_Group5-prod" {
  default     = "/home/ec2-user/.ssh/group5.pub"
  description = "Path to the public key to use in Linux VMs provisioning"
  type        = string
}