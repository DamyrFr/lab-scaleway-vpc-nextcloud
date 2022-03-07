variable "az" {
  type    = string
  default = "fr-par-1"
}

variable "default_tags" {
  type    = list(string)
  default = ["Terraform", "Nextcloud"]
}

