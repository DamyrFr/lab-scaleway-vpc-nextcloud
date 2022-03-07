output "bastion" {
  value = data.external.dhcp_bastion.result
}

output "compute" {
  value = data.external.dhcp_compute.result
}
