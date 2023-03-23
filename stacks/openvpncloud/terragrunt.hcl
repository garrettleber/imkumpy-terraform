include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "openvpncloud"
  id              = [115]
  cpu             = "1"
  mem             = "512"
  disk_location   = ["local-lvm"]
  disk_size       = "10G"
  ip              = ["192.168.0.98"]
}