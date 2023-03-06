terraform {
  # Terraform Remote Backend block - GCS (Google Cloud Storage).
  # # Additional Reference: https://www.terraform.io/language/settings/backends/gcs#configuration-variables
  backend "gcs" {
    bucket = "bkt-tfstate-22022023"             # Name of the GCS Bucket - must be globally unique.
    prefix = "terraform/dev/0-network"          # GCS prefix or folder name used inside the GCS Bucket. For example, "terraform/0-bootstrap" can be used.
  }
}
