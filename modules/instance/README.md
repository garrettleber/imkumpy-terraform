# Proxmox VM Terraform Module

This module creates one or more virtual machines on a Proxmox server, based on a specified template. It also creates DNS records for those virtual machines on an internal DNS server using the Pihole DNS management software.

## Usage

```hcl
module "proxmox_vm" {
  source            = "path/to/module"
  instance_count    = "2"
  name              = "my-instance"
  id                = ["120", "121"]
  mem               = "2048"
  cpu               = "2"
  disk_size         = "50G"
  disk_location     = ["local-lvm", "ssd-pool"]
  ip                = ["192.168.0.10", "192.168.0.11"]
  internal_domain   = "my-company.internal"
}
```

## Inputs

- `instance_count`: The number of instances to create.
- `name`: The base name of the instances. They will be numbered sequentially: `${name}1`, `${name}2`, etc.
- `id`: A list of unique IDs for the instances. The number of IDs should match `instance_count`.
- `mem`: The amount of RAM to allocate to each instance.
- `cpu`: The number of CPU cores to allocate to each instance.
- `disk_size`: The size of the virtual disk for each instance.
- `disk_location`: A list of possible storage locations for the virtual disk. The list will be cycled through for each instance.
- `ip`: A list of IP addresses for each instance. Use `"dhcp"` to obtain an IP address from the DHCP server.
- `internal_domain`: The domain name for the internal DNS server.

## Outputs

- `instance_ips`: A list of IP addresses for the instances, in the order they were created.
