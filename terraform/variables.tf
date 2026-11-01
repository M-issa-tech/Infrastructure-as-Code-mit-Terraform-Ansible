variable "proxmox_api_url" {
  type    = string
  default = "https://192.168.2.100:8006/"
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}