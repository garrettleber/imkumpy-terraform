resource "proxmox_lxc" "containers" {
  for_each        = var.containers
  hostname        = each.key
  vmid            = each.value["id"]
  cores           = each.value["cpu"]
  memory          = each.value["mem"]
  onboot          = true
  ostemplate      = local.lxc_images[coalesce(each.value["image"], "debian11")]
  ssh_public_keys = join("\n", var.ssh_keys)
  start           = true
  tags            = " "
  #tags            = each.value["tags"] != null ? join(",", ["terraform", each.value["tags"]]) : "terraform"
  target_node  = "ryzen-proxmox"
  unprivileged = true

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
    ip     = "${each.value["ip"]}/24"
    gw     = "192.168.0.1"
  }

  lifecycle {
    ignore_changes = [
      target_node,
      ssh_public_keys,
      network,
      nameserver,
      rootfs
    ]
  }
}

resource "pihole_dns_record" "containers_internal" {
  for_each = var.containers
  domain   = join(".", [each.key, var.internal_domain])
  ip       = each.value["ip"]
}
