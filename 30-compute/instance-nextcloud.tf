resource "scaleway_instance_security_group" "nextcloud" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = 80
  }
}

resource "scaleway_instance_server" "nextcloud" {
  name              = var.instance_name
  type              = "DEV1-S"
  image             = var.base_img
  security_group_id = scaleway_instance_security_group.nextcloud.id
  private_network {
    pn_id = data.scaleway_vpc_private_network.private.id
  }
  user_data = {
    cloud-init = file("${path.module}/files/nextcloud-init.tpl")
  }
  tags = var.default_tags
}
