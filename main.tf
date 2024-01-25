variable hostname {}
variable username {}
variable password {}

terraform {
  required_providers {
    bigip = {
      source = "terraform-providers/bigip"
    }
  }
  required_version = ">= 0.13"
}

provider "bigip" {
  address  = var.hostname
  username = var.username
  password = var.password
}

resource "bigip_fast_application" "MyChart" {

  template        = "epic_multi_env_templates/Epic Epic MyCHART"
  fast_json = <<EOF
{
      "tenant_name": "EPIC_VS_MyChart",
      "virtualAddress": "100.0.0.201",
      "server_addresses": ["100.1.1.20","100.1.1.21"],
      "service_port": "80"
}
EOF
}
