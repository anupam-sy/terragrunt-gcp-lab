// Network resource outputs
output "network_id" {
  value       = module.dev_vpc.network_id
  description = "The ID of the VPC being created"
}

output "subnets_ids" {
  value       = module.dev_vpc.subnets_ids
  description = "The IDs of the subnets being created"
}