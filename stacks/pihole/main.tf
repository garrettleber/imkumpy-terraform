resource "proxmox_lxc" "ns1" {
  hostname        = "ns1"
  vmid            = 211
  cores           = 1
  memory          = 512
  onboot          = true
  ostemplate      = local.lxc_images[debian11]
  ssh_public_keys = join("\n", var.ssh_keys)
  start           = true
  tags            = " "
  target_node     = "ryzen-proxmox"
  unprivileged    = true

  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    size    = "10G"
    storage = "local-lvm"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.0.53/24"
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

resource "proxmox_lxc" "ns2" {
  hostname        = "ns2"
  vmid            = 212
  cores           = 1
  memory          = 512
  onboot          = true
  ostemplate      = local.lxc_images[debian11]
  ssh_public_keys = join("\n", var.ssh_keys)
  start           = true
  tags            = " "
  target_node     = "ryzen-proxmox"
  unprivileged    = true

  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    size    = "10G"
    storage = "samsung-500gb"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "192.168.0.54/24"
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

resource "pihole_dns_record" "ns1" {
  domain = "ns1.${var.internal_domain}"
  ip     = "192.168.0.53"
}

resource "pihole_dns_record" "ns2" {
  domain = "ns2.${var.internal_domain}"
  ip     = "192.168.0.54"
}
