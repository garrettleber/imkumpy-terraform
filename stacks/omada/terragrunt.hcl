include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "omada"
  id              = [200]
  cpu             = "1"
  mem             = "2048"
  disk_location   = ["local"]
  disk_size       = "10G"
  ip              = ["192.168.0.95"]
}