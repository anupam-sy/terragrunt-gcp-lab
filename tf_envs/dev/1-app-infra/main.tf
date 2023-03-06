/*
1. The terraform_remote_state data source uses the latest state snapshot from a specified state backend to retrieve the root module output values from some other Terraform configuration.
2. You can use the terraform_remote_state data source without requiring or configuring a provider.
3. Although terraform_remote_state only exposes output values, its user must have access to the entire state snapshot, which often includes some sensitive information.

References: https://developer.hashicorp.com/terraform/language/state/remote-state-data
*/

data "terraform_remote_state" "projects_env" {
  backend = "gcs"

  config = {
    bucket = var.remote_state_bucket
    prefix = "terraform/dev/0-network"
  }
}

locals {
  network_id  = data.terraform_remote_state.projects_env.outputs.network_id
  subnets_ids = data.terraform_remote_state.projects_env.outputs.subnets_ids
}

// Resource block to reserve static Internal IP Address
resource "google_compute_address" "dev_vm_internal_ip" {
  project      = var.project_id
  name         = "dev-vm-internal-ip"
  region       = var.subnet_region
  address_type = "INTERNAL"
  address      = "10.10.10.2"
  subnetwork   = local.subnets_ids[0]
}