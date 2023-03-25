include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${path_relative_from_include()}//modules/dns"
}

inputs = {
  static_int_a_records = {
    "argocd"           = "192.168.0.31"
    "dietpi"           = "192.168.0.65"
    "k3s-ingress" = "192.168.0.30"
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

    "creative.mc"        = "mc"
    "fabric.mc"          = "mc"
    "fabric-creative.mc" = "mc"
    "vanillaish.mc"      = "mc"

    "loki"         = "k3s-ingress"

    "alertmanager"  = "rp"
    "git"           = "rp"
    "grafana"       = "rp"
    "homepage"      = "rp"
    # "mattermost"    = ""
    "omada"         = "rp"
    "qbittorrent"   = "rp"
    # "requests"      = ""
    "proxmox" = "rp"
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