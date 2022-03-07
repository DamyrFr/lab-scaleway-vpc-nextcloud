#https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/vpc_gateway_network
resource "scaleway_vpc_public_gateway_ip" "private" {
  zone = var.az
  tags = var.default_tags
}

resource "scaleway_vpc_public_gateway_dhcp" "private" {
  zone = var.az
  #    push_default_route = true
  subnet = var.network_private
}

resource "scaleway_vpc_public_gateway" "private" {
  name  = var.ig_name
  type  = var.ig_type
  ip_id = scaleway_vpc_public_gateway_ip.private.id
}

resource "scaleway_vpc_gateway_network" "private" {
  gateway_id         = scaleway_vpc_public_gateway.private.id
  private_network_id = data.scaleway_vpc_private_network.private.id
  dhcp_id            = scaleway_vpc_public_gateway_dhcp.private.id
}
