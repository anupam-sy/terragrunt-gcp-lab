locals {
  subnets = {
    for x in var.subnets :
    "${x.subnet_name}" => x
  }
}

/******************************************
	Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "subnetworks" {
  for_each = local.subnets

  project = var.project_id
  network = google_compute_network.network.name

  name                     = each.value.subnet_name
  description              = lookup(each.value, "description", null)
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  private_ip_google_access = lookup(each.value, "subnet_private_access", "false")

  secondary_ip_range = [
    for i in range(length(contains(keys(var.secondary_ranges), each.value.subnet_name) == true ? var.secondary_ranges[each.value.subnet_name] : [])) :
    var.secondary_ranges[each.value.subnet_name][i]
  ]
}