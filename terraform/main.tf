# ==========================================
# VM 1: CentOS Stream 9 (RPM-Basis) 
# ==========================================
module "centos_vm" {
  source = "./modules/proxmox_vm"

  name           = "centos-server"
  vm_id          = 101
  template_id    = 9001
  cpu_cores      = 2
  memory         = 2048
  disk_size      = 35
  ip_address     = "192.168.2.101/24"
  gateway        = "192.168.2.1"
  ssh_public_key = var.ssh_public_key
}

# ==========================================
# VM 2: Ubuntu Server (Debian-Basis) 
# ==========================================
module "ubuntu_vm" {
  source = "./modules/proxmox_vm"

  name           = "ubuntu-server"
  vm_id          = 102
  template_id    = 9000
  cpu_cores      = 2
  memory         = 2048
  disk_size      = 35 
  ip_address     = "192.168.2.102/24"
  gateway        = "192.168.2.1"
  ssh_public_key = var.ssh_public_key
}

# ==========================================
# LXC 1: Prometheus Container 
# ==========================================
module "prometheus_lxc" {
  source = "./modules/proxmox_lxc"

  hostname         = "prometheus"
  vm_id            = 103
  template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cpu_cores        = 1
  memory           = 1024
  disk_size        = 25 
  ip_address       = "192.168.2.103/24"
  gateway          = "192.168.2.1"
  ssh_public_key   = var.ssh_public_key
  password         = "password123"
}

# ==========================================
# LXC 2: Grafana Container 
# ==========================================
module "grafana_lxc" {
  source = "./modules/proxmox_lxc"

  hostname         = "grafana"
  vm_id            = 104
  template_file_id = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  cpu_cores        = 1
  memory           = 1024
  disk_size        = 25 
  ip_address       = "192.168.2.104/24"
  gateway          = "192.168.2.1"
  ssh_public_key   = var.ssh_public_key
  password         = "password123"
}