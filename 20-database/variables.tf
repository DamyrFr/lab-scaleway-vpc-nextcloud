variable "project" {
  type    = string
  default = "poc"
}

variable "database_node_type" {
  type    = string
  default = "db-dev-s"
}
variable "database_postgres_version" {
  type    = string
  default = "MySQL-8"
}

variable "region" {
  type    = string
  default = "fr-par"
}

variable "default_tags" {
  type    = list(string)
  default = ["Terraform"]
}
