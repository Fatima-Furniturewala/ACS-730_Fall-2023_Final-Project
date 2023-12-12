provider "aws" {
  region = "us-east-1"
}

# Data source for AMI id
data "aws_ami" "amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "terraform_remote_state" "remote_data" { // This is to use Outputs from Remote State
  backend = "s3"
  config = {
    bucket = "group5lsfathima"               // Bucket from where to GET Terraform State
    key    = "network/terraform.tfstate" // Object name in the bucket to GET Terraform State
    region = "us-east-1"                          // Region where bucket created
  }
}

# Data source for availability zones in us-east-1
data "aws_availability_zones" "available" {
  state = "available"
}

# Provision WebServers in public subnets
resource "aws_instance" "webserver_instances" {
  count                       = length(data.terraform_remote_state.remote_data.outputs.subnets_public_ids)
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.web_key.key_name
  subnet_id                   = data.terraform_remote_state.remote_data.outputs.subnets_public_ids[count.index]
  security_groups             = [aws_security_group.sg.id]
  associate_public_ip_address = true
  user_data                   = count.index < 2 ? file("${path.module}/install_httpd.sh") : null
  tags = merge(var.default_tags,
    {
      "Name" = "${var.prefix}-WebServers-${count.index + 1}"
    }
  )
}

# Provision VMs in private subnets
resource "aws_instance" "private_vms" {
  count                       = length(data.terraform_remote_state.remote_data.outputs.subnets_private_ids)
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.web_key.key_name
  subnet_id                   = data.terraform_remote_state.remote_data.outputs.subnets_private_ids[count.index]
  security_groups             = [aws_security_group.private_sg.id]
  associate_public_ip_address = false
  tags = merge(var.default_tags,
    {
      "Name" = "${var.prefix}-EC2-${count.index + 1}"
    }
  )
}

# Adding SSH key to Amazon EC2
resource "aws_key_pair" "web_key" {
  key_name   = "${var.prefix}-key"
  public_key = file("~/.ssh/${var.prefix}.pub")
}