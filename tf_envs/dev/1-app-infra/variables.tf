# Variables declaration
variable "terraform_service_account" {
  type        = string
  description = "Email of the service account for impersonation to run Terraform."
}

variable "remote_state_bucket" {
  description = "Backend bucket to load Terraform Remote State Data from previous steps."
  type        = string
}

variable "project_id" {
  type        = string
  description = "The ID of the project where subnet is present."
}

variable "subnet_region" {
  type        = string
  description = "The region where subnet is present."
}