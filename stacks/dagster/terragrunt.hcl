include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "dagster"
  id              = [170]
  cpu             = "2"
  mem             = "4096"
  disk_location   = ["samsung-500gb"]
  disk_size       = "10G"
  ip              = ["192.168.0.86"]
}