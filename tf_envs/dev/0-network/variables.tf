# Variables declaration
variable "terraform_service_account" {
  type        = string
  description = "Email of the service account for impersonation to run Terraform."
}

variable "project_id" {
  type        = string
  description = "The ID of the project where this VPC will be created"
}

variable "network_name" {
  type        = string
  description = "The name of the network being created"
}

variable "description" {
  type        = string
  description = "The description of the network resource. To modify this field, the resource will be recreated."
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, will delete the default internet gateway route."
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}