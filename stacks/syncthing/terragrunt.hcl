include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "syncthing"
  id              = [130]
  cpu             = "2"
  mem             = "1024"
  disk_location   = ["local-lvm"]
  disk_size       = "20G"
  ip              = ["192.168.0.96"]
}