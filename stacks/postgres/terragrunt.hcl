include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/instance"
}

inputs = {
  name          = "postgres"
  id            = [601]
  cpu           = "1"
  mem           = "2048"
  disk_location = ["samsung-500gb"]
  disk_size     = "20G"
  ip            = ["192.168.0.90"]
}