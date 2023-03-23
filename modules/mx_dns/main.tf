resource "cloudflare_record" "A_ext" {
  zone_id = var.cloudflare_zone_id
  name    = "mx.${var.external_domain}"
  value   = var.external_ip
  type    = "A"
  ttl     = 3600
}

resource "cloudflare_record" "MX" {
  zone_id  = var.cloudflare_zone_id
  name     = "@"
  value    = "mx.${var.external_domain}"
  type     = "MX"
  priority = 10
}

resource "cloudflare_record" "SPF" {
  zone_id = var.cloudflare_zone_id
  name    = "@"
  value   = "v=spf1 a mx ip4:${var.external_ip} ~all"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "DKIM" {
  zone_id = var.cloudflare_zone_id
  name    = "default._domainkey"
  value   = var.dkim_record
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "DMARC" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:garrett@garrettleber.com; ruf=mailto:garrett@garrettleber.com;"
  type    = "TXT"
  ttl     = 1
}
