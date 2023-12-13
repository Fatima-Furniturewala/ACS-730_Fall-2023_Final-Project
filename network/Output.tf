output "vpc_id" {
  value = module.vpc-prod.vpc_id
}

output "igw_id" {
    value = module.vpc-prod.igw_id
}

output "rt_id" {
    value = module.vpc-prod.rt_id
}

output "subnets_public_ids" {
    value = module.vpc-prod.subnets_public_ids
}

output "subnets_private_ids" {
    value = module.vpc-prod.subnets_private_ids
}
