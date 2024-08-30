provider "google" {
  project = "otelproject-432011"  # Replace with your GCP project ID
  region  = "europe-west1"  # Europe region
}

module "mysql_server" {
  source = "./instances/mysql-server"
}

module "apache_server" {
  source = "./instances/apache-server"
}

module "squid_proxy" {
  source = "./instances/squid-proxy"
}

module "exim_server" {
  source = "./instances/exim-server"
}

output "mysql-server_ip" {
  value = module.mysql_server.instance_ip
}

output "apache-server_ip" {
  value = module.apache_server.instance_ip
}

output "squid-proxy_ip" {
  value = module.squid_proxy.instance_ip
}

output "exim-server_ip" {
  value = module.exim_server.instance_ip
}
