locals {
  routes = {
    for i, route in var.routes :
    lookup(route, "name", format("%s-%s-%d", lower(var.network_name), "route", i)) => route
  }
}

/******************************************
	Routes
 *****************************************/
resource "google_compute_route" "routes" {
  for_each = local.routes

  project = var.project_id
  network = google_compute_network.network.name

  name                   = each.key
  description            = lookup(each.value, "description", null)
  dest_range             = lookup(each.value, "destination_range", null)
  next_hop_gateway       = lookup(each.value, "next_hop_internet", "false") == "true" ? "default-internet-gateway" : null
  next_hop_ip            = lookup(each.value, "next_hop_ip", null)
  next_hop_instance      = lookup(each.value, "next_hop_instance", null)
  next_hop_instance_zone = lookup(each.value, "next_hop_instance_zone", null)
  next_hop_vpn_tunnel    = lookup(each.value, "next_hop_vpn_tunnel", null)
  next_hop_ilb           = lookup(each.value, "next_hop_ilb", null)
  priority               = lookup(each.value, "priority", null)
  tags                   = compact(split(",", lookup(each.value, "tags", "")))

  depends_on = [google_compute_subnetwork.subnetworks]
}