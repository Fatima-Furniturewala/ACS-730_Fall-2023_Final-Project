# Set the AWS region
provider "aws" {
  region = "us-east-1"
}

# Get availability_zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create the Prod VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-vpc"
    }
  )
}

# Create public subnets

resource "aws_subnet" "subnets_public" {
  count             = length(var.public_cidr_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_cidr_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-public-subnet-${count.index + 1}"
    }
  )
}

# Create private subnets
resource "aws_subnet" "subnets_private" {
  count             = length(var.private_cidr_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_cidr_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-private-subnet-${count.index + 1}"
    }
  )
}


# Create a route table for the Internet access
resource "aws_route_table" "route_internet" {
  vpc_id = aws_vpc.vpc.id
  
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-rt-webservers"
    }
  )  
}


# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.default_tags, {
      Name = "${var.prefix}-igw"
    }
  )
}
resource "aws_route" "route_access" {
  route_table_id         = aws_route_table.route_internet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "route_association_internet_access" {
  count          = length(var.public_cidr_subnets)
  route_table_id = aws_route_table.route_internet.id
  subnet_id      = aws_subnet.subnets_public[count.index].id
}