include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/dns"
}

inputs = {
  static_int_a_records = {
    # k8s ingress
    "alertmanager" = "192.168.0.30"
    "grafana"      = "192.168.0.30"
    "loki"         = "192.168.0.30"

    "argocd"           = "192.168.0.31"
    "dietpi"           = "192.168.0.65"
    "k8s"              = "192.168.0.40"
    "pihole"           = "192.168.0.55"
    "proxmox-1"        = "192.168.0.100"
    "proxmox-backup"   = "192.168.0.105"
    "rpi"              = "192.168.0.65"
    "serverrack-power" = "192.168.10.10"
    "teamspeak"        = "192.168.0.32"
    "unraid"           = "192.168.0.104"
  }

  static_int_cname_records = {
    "mc" = "prod-mc"

    "creative.mc"        = "prod-mc"
    "fabric.mc"          = "prod-mc"
    "fabric-creative.mc" = "prod-mc"
    "vanillaish.mc"      = "prod-mc"

    "git"           = "rp"
    "homepage"      = "rp"
    # "mattermost"    = ""
    "omada"         = "rp"
    "qbittorrent"   = "rp"
    # "requests"      = ""
    "ryzen-proxmox" = "rp"
    # "zabbix"        = "rp"
  }

  static_ext_cname_records = [
    "*.mc",
    "mattermost",
    "mc",
    "requests",
    "teamspeak",
  ]
}