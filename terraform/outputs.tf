output "centos_ip" {
  value = module.centos_vm.ipv4_address
}

output "ubuntu_ip" {
  value = module.ubuntu_vm.ipv4_address
}

output "prometheus_ip" {
  value = module.prometheus_lxc.ipv4_address
}

output "grafana_ip" {
  value = module.grafana_lxc.ipv4_address
}