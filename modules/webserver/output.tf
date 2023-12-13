# For Webservers
output "webservers_ids" {
    value = aws_instance.webserver_instances[*].id
}


output "webserver_private_ips" {
    value = aws_instance.webserver_instances[*].private_ip
    description = "The private IP of the instances"
}

output "webserver_public_ips" {
    value = aws_instance.webserver_instances[*].public_ip
    description = "The public IP of the instances"
}

output "webserver_availability_zones" {
    value = aws_instance.webserver_instances[*].availability_zone
    description = "The availability_zone of the instances"
}

# For private VMs
output "private_vm_ids" {
    value = aws_instance.private_vms[*].id
}
output "private_vm_ips" {
    value = aws_instance.private_vms[*].private_ip
    description = "The private IP of the instances"
}


output "private_vm_availability_zones" {
    value = aws_instance.private_vms[*].availability_zone
    description = "The availability_zone of the instances"
}
