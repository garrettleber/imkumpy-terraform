include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "mattermost"
  id              = [120]
  cpu             = "1"
  mem             = "512"
  disk_location   = ["samsung-500gb"]
  disk_size       = "10G"
  ip              = ["192.168.0.97"]
  lxc_image       = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
}