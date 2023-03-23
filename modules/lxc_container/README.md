# Terraform Module README

## Proxmox LXC Container

This Terraform module creates a Proxmox LXC container with the specified configuration.

### Usage

To use this module, include the following code in your Terraform script:

```terraform
module "proxmox_lxc_container" {
  source           = "example.com/terraform/modules/proxmox_lxc_container"
  container_count  = 1
  name             = "mycontainer"
  id               = [100]
  cpu              = 2
  mem              = 2048
  lxc_image        = "proxmox/lxc/ubuntu-20.04-standard_20.04-1_amd64.tar.xz"
  ssh_keys         = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."]
  start            = true
  target_node      = "proxmox1"
  unprivileged     = true
  disk_size        = 32
  disk_location    = ["local-zfs", "local-lvm"]
  ip               = ["192.168.0.10"]
  internal_domain  = "internal.example.com"
}

output "container_ip" {
  value = module.proxmox_lxc_container.container_ip
}
```

### Inputs

The following inputs are required:

- `container_count`: (int) the number of containers to create.
- `name`: (string) the name of the container.
- `id`: (list of ints) the unique ID of the container.
- `cpu`: (int) the number of CPU cores to allocate to the container.
- `mem`: (int) the amount of memory to allocate to the container in MB.
- `lxc_image`: (string) the name of the LXC image to use for the container.
- `ssh_keys`: (list of strings) a list of SSH public keys to add to the container.
- `start`: (bool) whether to start the container automatically when the host starts.
- `target_node`: (string) the name of the Proxmox node where the container should be created.
- `unprivileged`: (bool) whether to create an unprivileged container.
- `disk_size`: (int) the size of the root disk in GB.
- `disk_location`: (list of strings) the list of storage locations where the root disk will be created.
- `ip`: (list of strings) the IP address of the container.
- `internal_domain`: (string) the internal domain of the container.

### Outputs

The following output is available:

- `container_ip`: the IP address of the container.

### Examples

Basic configuration with one container:

```terraform
module "proxmox_lxc_container" {
  source           = "example.com/terraform/modules/proxmox_lxc_container"
  container_count  = 1
  name             = "mycontainer"
  id               = [100]
  cpu              = 2
  mem              = 2048
  lxc_image        = "proxmox/lxc/ubuntu-20.04-standard_20.04-1_amd64.tar.xz"
  ssh_keys         = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."]
  start            = true
  target_node      = "proxmox1"
  unprivileged     = true
  disk_size        = 32
  disk_location    = ["local-zfs", "local-lvm"]
  ip               = ["192.168.0.10"]
  internal_domain  = "internal.example.com"
}

output "container_ip" {
  value = module.proxmox_lxc_container.container_ip
}
```

Multiple containers:

```terraform
module "proxmox_lxc_container" {
  source           = "example.com/terraform/modules/proxmox_lxc_container"
  container_count  = 2
  name             = "mycontainer"
  id               = [100, 101]
  cpu              = 2
  mem              = 2048
  lxc_image        = "proxmox/lxc/ubuntu-20.04-standard_20.04-1_amd64.tar.xz"
  ssh_keys         = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ..."]
  start            = true
  target_node      = "proxmox1"
  unprivileged     = true
  disk_size        = 32
  disk_location    = ["local-zfs", "local-lvm"]
  ip               = ["192.168.0.10", "192.168.0.11"]
  internal_domain  = "internal.example.com"
}

output "container_ip_1" {
  value = module.proxmox_lxc_container[0].container_ip
}

output "container_ip_2" {
  value = module.proxmox_lxc_container[1].container_ip
}
```
