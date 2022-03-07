data "scaleway_vpc_private_network" "private" {
  name = "internal"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
