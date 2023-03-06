terraform {
  required_version = ">= 1.3.6"

  required_providers {
    # Google Provider Configuration Reference: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.51.0"
    }
  }
}
