resource "cloudflare_record" "static_external_a_root" {
  zone_id = local.common_vars.locals.cloudflare_zone_id
  name    = "@"
  value   = local.common_vars.external_domain
  type    = "A"
}

resource "cloudflare_record" "static_external_a" {
  for_each = var.static_ext_a_records
  zone_id  = local.common_vars.cloudflare_zone_id
  name     = join(".", [each.key, local.common_vars.external_domain])
  value    = each.value
  type     = "A"
}

resource "cloudflare_record" "static_external_cname" {
  for_each = toset(var.static_ext_cname_records)
  name     = each.key
  type     = "CNAME"
  zone_id  = local.common_vars.cloudflare_zone_id
  value    = local.common_vars.external_domain
}

resource "pihole_dns_record" "static_internal_a" {
  for_each = var.static_int_a_records
  domain   = join(".", [each.key, local.common_vars.internal_domain])
  ip       = each.value
}

resource "pihole_cname_record" "static_internal_cname" {
  for_each = var.static_int_cname_records
  domain   = join(".", [each.key, local.common_vars.internal_domain])
  target   = join(".", [each.value, local.common_vars.internal_domain])
}
