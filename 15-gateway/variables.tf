variable "az" {
  type    = string
  default = "fr-par-1"
}

variable "network_private" {
  type    = string
  default = "10.1.0.0/24"
}

variable "default_tags" {
  type    = list(string)
  default = ["Terraform", "Nextcloud"]
}

variable "ig_name" {
  type    = string
  default = "out-private"
}

variable "ig_type" {
  type    = string
  default = "VPC-GW-S"
}
