include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/instance"
}

inputs = {
  name          = "portainer-agent"
  id            = [331]
  cpu           = "2"
  mem           = "4096"
  disk_location = ["samsung-500gb"]
  disk_size     = "40G"
  ip            = ["192.168.0.71"]
  only_single_instance = false # in case we need to add more later
  instance_count = 1
}