resource "proxmox_vm_qemu" "instance" {
  count            = var.instance_count
  name             = var.only_single_instance ? var.name : "${var.name}${count.index + 1}"
  vmid             = var.id[count.index]
  target_node      = "ryzen-proxmox"
  clone            = "debian11-template"
  os_type          = "cloud-init"
  oncreate         = true
  agent            = 1
  memory           = var.mem
  cores            = var.cpu
  cpu              = "kvm64"
  onboot           = true
  automatic_reboot = false
  disk {
    size    = var.disk_size
    storage = var.disk_location[length(var.disk_location) % (count.index + 1)]
    type    = "scsi"
  }
  ipconfig0 = var.ip[count.index] != "dhcp" ? "ip=${var.ip[count.index]}/24,gw=192.168.0.1" : "ip=dhcp"

  lifecycle {
    ignore_changes = [
      target_node,
      ciuser,
      sshkeys,
      network,
    ]
  }
}

resource "pihole_dns_record" "instance_internal" {
  count  = var.create_internal_dns_record ? var.instance_count : 0
  domain = join(".", [var.only_single_instance ? var.name : "${var.name}${count.index + 1}", var.internal_domain])
  ip     = var.ip[count.index] != "dhcp" ? var.ip[count.index] : proxmox_vm_qemu.instance[count.index].default_ipv4_address
}
