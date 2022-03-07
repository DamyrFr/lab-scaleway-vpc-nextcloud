# aic/dev/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

inputs = {
  az      = "fr-par-1"
  network = "10.1.0.0/24"
}
