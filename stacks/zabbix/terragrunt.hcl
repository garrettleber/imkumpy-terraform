include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/lxc_container"
}

inputs = {
  name            = "zabbix"
  id              = [140]
  cpu             = "2"
  mem             = "2048"
  disk_location   = ["samsung-500gb"]
  disk_size       = "20G"
  ip              = ["192.168.0.93"]
}