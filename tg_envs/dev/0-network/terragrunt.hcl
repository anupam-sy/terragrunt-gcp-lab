# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# Generate providers.tf for providers configurations
generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
  provider "google" {
    impersonate_service_account = "terraform-local-sa@clear-tape-374908.iam.gserviceaccount.com"
  }

  provider "google-beta" {
    impersonate_service_account = "terraform-local-sa@clear-tape-374908.iam.gserviceaccount.com"
  }
  EOF
}

/*
Specify where to find terraform configuration files in terraform block. Terragrunt will make a 
copy of the source folder in the Terragrunt working directory (typically under `.terragrunt-cache`).
*/

# Define the source of the module to be used in terraform code
terraform {
  source = "${path_relative_from_include()}/../modules/terraform-gcp-network"
}

# Provide the input values to be used for the variables of the module
inputs = {
  project_id                             = "clear-tape-374907"
  network_name                           = "bootcamp-dev-vpc"
  description                            = "bootcamp development vpc network"
  delete_default_internet_gateway_routes = true

  subnets = [
    {
      subnet_name   = "bootcamp-dev-vpc-snet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name           = "bootcamp-dev-vpc-snet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-central1"
      description           = "bootcamp development subnet 02"
      subnet_private_access = "true"
    },
    {
      subnet_name   = "bootcamp-dev-vpc-snet-03"
      subnet_ip     = "10.10.30.0/24"
      subnet_region = "us-central1"
    }
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = "bootcamp-dev-vpc-snet-01-secranges-01"
        ip_cidr_range = "192.168.64.0/24"
      },
      {
        range_name    = "bootcamp-dev-vpc-snet-01-secranges-02"
        ip_cidr_range = "192.168.65.0/24"
      },
    ]

    subnet-02 = []
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}