output "vm_id" {
  value = proxmox_virtual_environment_container.container.vm_id
}

output "ipv4_address" {
  value = var.ip_address
}