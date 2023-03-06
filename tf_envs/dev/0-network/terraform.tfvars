# Variables definition
terraform_service_account              = "terraform-local-sa@clear-tape-374908.iam.gserviceaccount.com"
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

