variable "pihole_password" {
  type        = string
  description = "password to authenticate with pihole server (internal dns)"
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
