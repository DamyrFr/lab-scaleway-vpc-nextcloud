
variable "base_img" {
  type = string
  default = "ubuntu_focal"
}

# Database
variable "database_node_type" {
  default = "db-dev-s"
}
variable "database_postgres_version" {
  default = "PostgreSQL-12"
}
