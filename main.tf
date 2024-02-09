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

resource "bigip_fast_application" "MyChart01" {

  template        = "epic_multi_env_templates/Multi_MyChart_VS"
  fast_json = <<EOF
  {
  "env": "PROD",
  "tenant_name": "VS_MyChart20",
  "virtualAddress": "111.0.0.201",
  "server_addresses": [
    "111.1.1.20",
    "111.1.1.21"
  ],
  "service_port": "80",
  "certificate": "default.crt",
  "privatekey": "default.key",
  "instanceWebsiteName": "MyChartsWebsiteName",
  "iCWebsiteName": "ICWebsiteName"
}
EOF
}
