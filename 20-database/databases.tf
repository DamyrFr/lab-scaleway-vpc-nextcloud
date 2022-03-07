resource "random_password" "this" {
  length           = 32
  special          = true
  override_special = "_%@"
}

resource "local_file" "password" {
  content  = random_password.this.result
  filename = "${path.module}/../db_password.secret"
}

resource "scaleway_rdb_instance" "this" {
  name              = "${var.project}-mysql"
  node_type         = var.database_node_type
  engine            = var.database_postgres_version
  is_ha_cluster     = false #it's just a POC
  disable_backup    = true
  user_name         = "nextcloud"
  password          = random_password.this.result
  region            = var.region
  tags              = var.default_tags
  volume_type       = "bssd"
  volume_size_in_gb = 10
  private_network {
    ip_net = "10.1.0.200/24" #pool high
    pn_id  = data.scaleway_vpc_private_network.this.id
  }
}
