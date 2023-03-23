include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "dockerhost"
  id              = [300]
  cpu             = "2"
  mem             = "4096"
  disk_location   = ["local-lvm"]
  disk_size       = "20G"
  ip              = ["192.168.0.94"]
}