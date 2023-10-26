inputs = {
  cloudflare_zone_id  = "233ad89f213f9c3ff539150f0721c612"
  external_domain     = "imkumpy.com"
  external_ip         = "206.225.75.22"

  internal_domain = "imkumpy.in"
  
  lxc_image     = "local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst"
  ssh_keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmh8Pn/HwXN+nqLZSsFdVH4FeXNyyTPstZak7iv45qbo32XQ2F4dKBBNy83Y4woDbzi5HqPU+s5mUA9t2DBx7UvJseGcXSSdtm/xkXZwVTxUCd8OlNd3NVm4mlIwXRRUztT3bLqfqHP7XV4uQqSHtBzTIlj4EWsIpfSn8Y6bneFGMI04NqePGmS7Cx6ahO2FqtESy1YTb1Ahwsxd8cgCs4/nVbzXtbCd3AUvvs9htsVMyORNMgQd44+KkXseFyQ3cvDVog07ThepTh2VcN8ei6pKrNRen/Qx+Oomn8gKz9Eu7JJWinQCjJeSrPxrFXJWjEnyFcEubAc/2YBx/9TT8tBUGKLLfmc+teVQyhb8JrAGPd7WDL2XCmjgCEZEa4MijrQsZg1vLUZRu6Yde/N0lhHIDD8SZ2h6aUh9cTQAJr8Va5uhDiiTB4HojSUEv9meCCvnoO8mXZoQ5URTfL8Qwy/zJr1M60S/hte8gqdNowPhWbpz7ziSgWm6/0QUugsjs= garrett@Garretts-MBP"
  ]
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
  url      = "http://pihole.imkumpy.in/"
  password = var.pihole_password
}
EOF
}
