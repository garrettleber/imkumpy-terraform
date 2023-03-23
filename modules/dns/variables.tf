variable "cloudflare_zone_id" {
  description = "The DNS zone ID to add the record to"
  type        = string
}

variable "external_domain" {
  description = "The external domain name that records will be created for"
  type        = string
}

variable "external_ip" {
  description = "Public IP (NAT) to use for public services"
  type        = string
}

variable "internal_domain" {
  description = "The internal domain name that records will be created for"
  type        = string
}

variable "pihole_password" {
  type        = string
  description = "password to authenticate with pihole server (internal dns)"
}

variable "static_ext_a_records" {
  description = "A map of static external DNS A records to create (cloudflare)"
  type        = map(string)
  default     = {}
}

variable "static_ext_cname_records" {
  description = "A list of static external DNS CNAME records to create for public IP (cloudflare)"
  type        = list(string)
  default     = []
}

variable "static_int_a_records" {
  description = "A map of static internal DNS A records to create (pihole)"
  type        = map(string)
  default     = {}
}

variable "static_int_cname_records" {
  description = "A map of static internal CNAME records to create (pihole)"
  type        = map(string)
  default     = {}
}
