include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "ns"
  container_count = 2
  # create_internal_dns_record = false # pihole IS the internal dns
  id              = [211, 212]
  cpu             = "1"
  mem             = "512"
  disk_location   = ["local-lvm", "samsung-500gb"]
  disk_size       = "10G"
  ip              = ["192.168.0.53", "192.168.0.54"] # 192.168.0.55 is also used as VIP
}