resource "scaleway_instance_security_group" "bastion" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = 22
    ip     = chomp(data.http.myip.body)
  }
}

resource "scaleway_instance_server" "bastion" {
  name              = "bastion"
  type              = "DEV1-S"
  image             = var.base_img
  security_group_id = scaleway_instance_security_group.bastion.id
  private_network {
    pn_id = data.scaleway_vpc_private_network.private.id
  }
  user_data = {
    cloud-init = file("${path.module}/files/bastion-init.tpl")
  }
  tags = var.default_tags
}
