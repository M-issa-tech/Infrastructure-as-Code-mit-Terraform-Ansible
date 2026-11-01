terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.66.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  name      = var.name
  node_name = "proxmox"
  vm_id     = var.vm_id

  scsi_hardware = "virtio-scsi-pci"

  clone {
    vm_id = var.template_id
    full  = true 
  }

  cpu {
    cores = var.cpu_cores
    type  = "host"
  }

  memory {
    dedicated = var.memory
  }

  disk {
    datastore_id = "local"
    interface    = "scsi0"
    size         = var.disk_size
    file_format  = "qcow2"
  }

  agent {
    enabled = false
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    datastore_id  = "local"
    interface     = "ide2"
    
    ip_config {
      ipv4 {
        address = var.ip_address
        gateway = var.gateway
      }
    }
    
    user_account {
      username = "sysadmin"
      keys     = compact([var.ssh_public_key])
    }
  }

  boot_order = ["scsi0"]
}
