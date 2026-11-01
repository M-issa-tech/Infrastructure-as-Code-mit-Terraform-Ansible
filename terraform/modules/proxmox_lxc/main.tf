terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.0"
    }
  }
}

resource "proxmox_virtual_environment_container" "container" {
  node_name    = "proxmox"
  vm_id        = var.vm_id
  unprivileged = true
  started      = true

  features {
    nesting = true
  }

  operating_system {
    template_file_id = var.template_file_id
    type             = "ubuntu"
  }

  cpu {
    cores = var.cpu_cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = "local"
    size         = var.disk_size
  }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  initialization {
    hostname = var.hostname
    
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    
    user_account {
      keys     = compact([var.ssh_public_key])
      password = var.password
    }
  }
}
