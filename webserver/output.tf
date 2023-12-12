# # For Webservers
# output "webserver_ids" {
#   value = module.webserver.webservers_ids
# }

# output "webserver_private_ips" {
#   value = module.webserver.webserver_private_ips
# }


# output "webserver_public_ips" {
#   value = module.webserver.webserver_public_ips
# }


# output "instance_availability_zones" {
#     value = module.webserver.webserver_availability_zones
# }

# # For private VMs
# output "private_vm_ids" {
#   value = module.webserver.private_vm_ids
# }

# output "private_vm_private_ips" {
#   value = module.webserver.private_vm_private_ips
# }


# output "private_vm_availability_zones" {
#     value = module.webserver.private_vm_availability_zones
# }

output "webservers_ids" {
  value = module.webserver.webservers_ids
}

output "webserver_private_ips" {
  value = module.webserver.webserver_private_ips
}

output "webserver_public_ips" {
  value = module.webserver.webserver_public_ips
}

output "webserver_availability_zones" {
  value = module.webserver.webserver_availability_zones
}

output "private_vm_ids" {
  value = module.webserver.private_vm_ids
}

output "private_vm_ips" {
  value = module.webserver.private_vm_ips
}

output "private_vm_availability_zones" {
  value = module.webserver.private_vm_availability_zones
}