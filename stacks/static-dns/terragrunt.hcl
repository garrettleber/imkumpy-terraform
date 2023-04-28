include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/dns"
}

inputs = {
  static_int_a_records = {
    "dietpi"           = "192.168.0.65"
    "pihole"           = "192.168.0.55"
    "proxmox-1"        = "192.168.0.100"
    "proxmox-backup"   = "192.168.0.105"
    "rpi"              = "192.168.0.65"
    "serverrack-power" = "192.168.10.10"
    "unraid"           = "192.168.0.104"
  }

  static_int_cname_records = {
    "teamspeak"    = "portainer-agent1"
    
    "wing"        = "pterodactyl-wings"

    "git"           = "rp"
    "homepage"      = "rp"
    "omada"         = "rp"
    "panel"         = "rp"
    "plex"          = "rp"
    "proxmox"       = "rp"
    "qbittorrent"   = "rp"
  }

  static_ext_cname_records = [
    "*.mc",
    "mattermost",
    "mc",
    "plex",
    "requests",
    "teamspeak",
  ]
}