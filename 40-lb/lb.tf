resource "scaleway_lb_ip" "lb" {
}

resource "scaleway_lb" "this" {
  ip_id = scaleway_lb_ip.lb.id
  name  = "Nextcloud"
  type  = "LB-S"
  tags  = var.default_tags
  private_network {
    private_network_id = data.scaleway_vpc_private_network.private.id
    dhcp_config        = true
  }
}

resource "scaleway_lb_backend" "this" {
  lb_id            = scaleway_lb.this.id
  name             = "Nextcloud"
  forward_protocol = "http"
  forward_port     = "80"
  server_ips       = ["${data.external.dhcp_compute.result.ip}"]
}

resource "scaleway_lb_frontend" "this" {
  lb_id        = scaleway_lb.this.id
  backend_id   = scaleway_lb_backend.this.id
  name         = "Nextcloud"
  inbound_port = "80"
}
