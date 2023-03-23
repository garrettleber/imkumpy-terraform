variable "internal_domain" {
  description = "The internal domain name that records will be created for"
  type        = string
}

variable "pihole_password" {
  type        = string
  description = "Password to authenticate with pihole server (internal dns)"
}

#
# Instance vars
#

variable "cpu" {
  type        = string
  description = "The number of CPU cores. e.g. 2"
  default     = "1"
}

variable "create_internal_dns_record" {
  type        = bool
  description = "Whether or not to create internal dns record(s) for instance(s)"
  default     = true
}

variable "disk_location" {
  type        = list(string)
  description = "The disk location, optional to list multiple when instance count is greater than 1. e.g. local-lvm"
}

variable "disk_size" {
  type        = string
  description = "The size of your disks e.g. 80G"
}

variable "id" {
  type        = list(string)
  description = "The VM ID in proxmox, must be the same length as instance count. e.g. 101"
}

variable "instance_count" {
  type        = number
  description = "Number of instances to deploy"
  default     = 1
}

variable "ip" {
  type        = list(string)
  description = "The ip to give the instance(s), must be the same length as instance count. e.g. dhcp, or 192.168.0.10"
}

variable "name" {
  type        = string
  description = "The hostname of the instance"
}

variable "mem" {
  type        = string
  description = "The amount of RAM. e.g. 4096"
}
