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

variable "dkim_record" {
  type        = string
  description = "value for DKIM dns record (must be pulled from mx server at /etc/opendkim/keys/<domain>)"
}
