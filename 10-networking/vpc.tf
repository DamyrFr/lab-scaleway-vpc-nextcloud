# On créer un VPC
resource "scaleway_vpc_private_network" "private" {
  name = "internal"
  tags = var.default_tags
}
