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

variable "external_ip" {
  description = "Public IP (NAT) to use for public services"
  type        = string
}

variable "dkim_record" {
  type        = string
  description = "value for DKIM dns record (must be pulled from mx server at /etc/opendkim/keys/<domain>)"
}

variable "internal_domain" {
  description = "The internal domain name that records will be created for"
  type        = string
}

variable "mailexchanger" {
  description = "a map of mx servers to create in proxmox"
  type = map(object({
    id            = string           # the VM ID in proxmox. e.g. 101
    disk_location = string           # the disk location. e.g. local-lvm
    disk_size     = string           # the size of your disks e.g. 80G
    tags          = optional(string) # tags you would like to add to the instance
    ip            = string           # the ip to give the instance. e.g. dhcp, or 192.168.0.10
  }))
}
