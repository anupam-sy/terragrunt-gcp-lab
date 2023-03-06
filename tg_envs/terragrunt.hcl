# This is the root backend file for the backend to DRY

locals {
  # root bucket for managing module state files
  state_bucket = "bkt-tfstate-22022023"
}

remote_state {
  backend = "gcs"
  config = {
    bucket = local.state_bucket
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
}