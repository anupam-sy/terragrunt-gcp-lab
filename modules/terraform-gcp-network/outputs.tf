// Network resource outputs
output "network" {
  value       = google_compute_network.network
  description = "The VPC resource being created"
}

output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = google_compute_network.network.id
  description = "The ID of the VPC being created"
}

// Subnet resource outputs
output "subnets" {
  value       = google_compute_subnetwork.subnetworks
  description = "The created subnet resources"
}

output "subnets_names" {
  value = [
    for subnetwork in google_compute_subnetwork.subnetworks :
    subnetwork.name
  ]
  description = "The names of the subnets being created"
}

output "subnets_ids" {
  value       = [for subnetwork in google_compute_subnetwork.subnetworks : subnetwork.id]
  description = "The IDs of the subnets being created"
}

// Route resource outputs
output "routes" {
  value       = google_compute_route.routes
  description = "The created routes resources"
}

output "route_names" {
  value       = [for route in google_compute_route.routes : route.name]
  description = "The route names associated with this VPC"
}