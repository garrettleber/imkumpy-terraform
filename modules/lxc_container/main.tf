resource "proxmox_lxc" "container" {
  count           = var.container_count
  hostname        = var.container_count > 1 ? "${var.name}${count.index + 1}" : var.name
  vmid            = var.id[count.index]
  cores           = var.cpu
  memory          = var.mem
  onboot          = true
  ostemplate      = var.lxc_image
  ssh_public_keys = join("\n", var.ssh_keys)
  start           = true
  target_node     = "ryzen-proxmox"
  unprivileged    = true
  tags            = " "

  features {
    nesting = true
  }

  // Terraform will crash without rootfs defined
  rootfs {
    size    = var.disk_size
    storage = var.disk_location[count.index % length(var.disk_location)]
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${var.ip[count.index]}/24"
    gw     = "192.168.0.1"
  }

  lifecycle {
    ignore_changes = [
      target_node,
      ssh_public_keys,
      network,
      nameserver,
    ]
  }
}

resource "pihole_dns_record" "instance_internal" {
  count  = var.create_internal_dns_record ? var.container_count : 0
  domain = join(".", [var.container_count > 1 ? "${var.name}${count.index + 1}" : var.name, var.internal_domain])
  ip     = var.ip[count.index]
}
