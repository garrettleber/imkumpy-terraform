resource "proxmox_lxc" "mailexchanger" {
  for_each        = var.mailexchanger
  hostname        = each.key
  vmid            = each.value["id"]
  target_node     = "ryzen-proxmox"
  ostemplate      = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  ssh_public_keys = join("\n", var.ssh_keys)
  start           = true
  tags            = " "
  #tags            = each.value["tags"] != null ? join(",", ["terraform", each.value["tags"]]) : "terraform"
  unprivileged = true
  onboot       = true

  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    size    = each.value["disk_size"]
    storage = each.value["disk_location"]
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${each.value[ip]}/24"
    gw     = "192.168.0.1"
  }

  lifecycle {
    ignore_changes = [
      target_node,
      ssh_public_keys,
      network
    ]
  }
}

resource "cloudflare_record" "A_ext" {
  for_each = var.mailexchanger
  zone_id  = var.cloudflare_zone_id
  name     = join(".", [each.key, var.external_domain])
  value    = var.external_ip
  type     = "A"
  ttl      = 3600
}

resource "pihole_dns_record" "A_int" {
  for_each = var.mailexchanger
  domain   = join(".", [each.key, var.internal_domain])
  ip       = each.value[ip]
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
