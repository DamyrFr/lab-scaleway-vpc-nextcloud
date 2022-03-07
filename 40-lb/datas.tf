data "scaleway_vpc_private_network" "private" {
  name = "internal"
}

data "external" "dhcp_bastion" {
  program = ["bash", "./../bin/get_ip_from_hostname.sh", "bastion"]
}

data "external" "dhcp_compute" {
  program = ["bash", "./../bin/get_ip_from_hostname.sh", "${var.instance_name}"]
}

data "scaleway_vpc_public_gateway" "this" {
  name = var.ig_name
}
