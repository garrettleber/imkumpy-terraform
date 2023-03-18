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
