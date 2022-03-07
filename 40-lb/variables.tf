variable "region" {
  type    = string
  default = "fr-par"
}

variable "instance_name" {
  type    = string
  default = "nextcloud"
}

variable "default_tags" {
  type    = list(string)
  default = ["Terraform", "Nextcloud"]
}

variable "ig_name" {
  type    = string
  default = "out-private"
}
