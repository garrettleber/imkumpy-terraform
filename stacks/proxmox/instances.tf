resource "proxmox_vm_qemu" "instances" {
  for_each    = var.instances
  name        = each.key
  vmid        = each.value["id"]
  target_node = "ryzen-proxmox"
  clone       = "debian11-template"
  os_type     = "cloud-init"
  oncreate    = true
  agent       = 1
  memory      = each.value["mem"]
  cores       = each.value["cpu"]
  cpu         = "kvm64"
  onboot      = true
  disk {
    size    = each.value["disk_size"]
    storage = each.value["disk_location"]
    type    = "scsi"
  }
  ipconfig0 = each.value["ip"] != "dhcp" ? "ip=${each.value["ip"]}/24,gw=192.168.0.1" : "ip=dhcp"

  lifecycle {
    ignore_changes = [
      target_node,
      ciuser,
      sshkeys,
      network
    ]
  }
}

resource "pihole_dns_record" "instances_internal" {
  for_each = var.instances
  domain   = join(".", [each.key, var.internal_domain])
  ip       = each.value["ip"] != "dhcp" ? each.value["ip"] : proxmox_vm_qemu.instances[each.key].default_ipv4_address
}
