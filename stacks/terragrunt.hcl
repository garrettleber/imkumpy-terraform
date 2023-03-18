inputs = {
  cloudflare_zone_id  = "233ad89f213f9c3ff539150f0721c612"
  external_domain     = "imkumpy.com"
  external_ip         = "206.225.75.22"

  internal_domain = "imkumpy.in"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "imkumpy-terraform-state"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    # dynamodb_table = "my-lock-table"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
terraform {
  required_version = ">=1.4.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    pihole = {
      source  = "ryanwholey/pihole"
      version = "0.0.12"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.0.100:8006/api2/json"
  pm_tls_insecure = true
}

provider "pihole" {
  url      = "http://pihole.kumpdev.com/"
  password = var.pihole_password
}
EOF
}