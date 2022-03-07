skip = true

# aic/terragrunt.hcl
generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
      version = "2.2.1-rc.1"
    }
  }
}

provider "scaleway" {
  profile = "perso"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
	config = {
    bucket                      = "terraform-state-damyr"
    key                         = "${path_relative_to_include()}/terraform-vpc-poc.tfstate"
    region                      = "fr-par"
    endpoint                    = "https://s3.fr-par.scw.cloud"
    skip_credentials_validation = true
    skip_region_validation      = true
  }
}

inputs = {
  default_tags  = ["Terraform", "Nextcloud"]
  base_img      = "ubuntu_focal"
  instance_name = "nextcloud"
  ig_name       = "out-private"
  ig_type       = "VPC-GW-S"
}
