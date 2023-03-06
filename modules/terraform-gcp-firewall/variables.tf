// Common variables
variable "project_id" {
  description = "The ID of the project of the VPC and firewall"
  type        = string
}

// Network resource variable declaration
variable "network_name" {
  description = "The name of the network to attach the firewall rules"
  type        = string
}

// Firewall resource variable declaration
variable "rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    name                    = string
    description             = string
    direction               = string
    priority                = number
    ranges                  = list(string)
    source_tags             = list(string)
    source_service_accounts = list(string)
    target_tags             = list(string)
    target_service_accounts = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
    log_config = object({
      metadata = string
    })
  }))
}