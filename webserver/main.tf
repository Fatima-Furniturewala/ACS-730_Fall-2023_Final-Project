# Module to deploy basic networking 
module "webserver" {
  source = "../modules/webserver"
  prefix        = var.prefix
  instance_type = var.instance_type
  default_tags  = var.default_tags
}