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

  template        = "epic_multi_env_templates/Epic_mychart"
  fast_json = <<EOF
{
      "tenant_name": "EPIC_VS_MyChart",
      "env": "nonProd",
      "virtualAddress": "100.0.0.201",
      "server_addresses": ["100.1.1.20","100.1.1.21"],
      "service_port": "80",
      "instanceWebsiteName"": "MyChartsWebsiteName",
      "certificate": "default.crt",
      "privatekey": "default.key"

}
EOF
}

/*resource "bigip_fast_application" "foo-app" {
  template  = "examples/simple_http"
  fast_json = <<EOF
{
"tenant_name": "Someten",
"application_name": "myapp",
"virtual_port": 8080,
"virtual_address": "200.1.1.1",
"server_port": 80,
"server_addresses": ["201.1.1.2"]
}
EOF
}*/
