// Module block to deploy VPC Network
module "dev_vpc" {
  source = "../../../modules/terraform-gcp-network"

  project_id                             = var.project_id
  network_name                           = var.network_name
  description                            = var.description
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  subnets                                = var.subnets
  secondary_ranges                       = var.secondary_ranges
  routes                                 = var.routes
}