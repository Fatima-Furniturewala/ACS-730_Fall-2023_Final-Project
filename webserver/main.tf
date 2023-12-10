# Module to deploy basic networking for terraform1
module "webserver" {
  source              = "../modules/webserver"
  env                 = var.env
  instance_type       = var.instance_type
  prefix              = var.prefix
  default_tags        = var.default_tags
}
