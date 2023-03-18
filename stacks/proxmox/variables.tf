variable "cloudflare_zone_id" {
  description = "The DNS zone ID to add the record to"
  type        = string
}

variable "pihole_password" {
  type        = string
  description = "password to authenticate with pihole server (internal dns)"
}

variable "ssh_keys" {
  description = "List of ssh keys to add to lxc containers"
  type        = list(string)
}

variable "external_domain" {
  description = "The external domain name that records will be created for"
  type        = string
}

variable "internal_domain" {
  description = "The internal domain name that records will be created for"
  type        = string
}

variable "instances" {
  description = "a map of instances to create in proxmox"
  type = map(object({
    id            = string # the VM ID in proxmox. e.g. 101
    cpu           = string # the num of CPU cores. e.g. 2
    mem           = string # the amount of RAM. e.g. 4096
    disk_location = string # the disk location. e.g. local-lvm
    disk_size     = string # the size of your disks e.g. 80G
    ip            = string # the ip to give the instance. e.g. dhcp, or 192.168.0.10
  }))
}

variable "containers" {
  description = "a map of lxc containers to create in proxmox"
  type = map(object({
    cpu           = optional(string) # the num of CPU cores. e.g. 2
    mem           = optional(string) # the amount of RAM. e.g. 4096
    disk_location = string           # the disk location. e.g. local-lvm
    disk_size     = string           # the size of your disk e.g. 80G
    id            = string           # the VM ID in proxmox. e.g. 101
    image         = optional(string) # image to use for the container, e.g. "ubuntu2004"
    ip            = string           # the ip to give the instance. e.g. dhcp, or 192.168.0.10
  }))
}
