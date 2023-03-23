include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/instance"
}

inputs = {
  name          = "k3s-server1"
  id            = [400]
  cpu           = "2"
  mem           = "4096"
  disk_location = ["samsung-500gb"]
  disk_size     = "20G"
  ip            = ["192.168.0.40"]
}