output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
    value = aws_vpc.vpc.cidr_block
}

output "igw_id" {
    value = aws_internet_gateway.igw.id
}

output "rt_id" {
    value = aws_route_table.route_internet.id
}


output "subnets_public_ids" {
    value = aws_subnet.subnets_public[*].id
}

output "subnets_private_ids" {
    value = aws_subnet.subnets_private[*].id
}