resource "scaleway_vpc_public_gateway_pat_rule" "main" {
  gateway_id   = data.scaleway_vpc_public_gateway.this.id
  private_ip   = data.external.dhcp_bastion.result.ip
  private_port = 22
  public_port  = 22
  protocol     = "both"
}
