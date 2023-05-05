# imkumpy-terraform

A repo to manage my self-hosted resources via Terraform

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) 1.4.0+
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) 0.44.0+
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) For remote state management
- Environment variables for Terraform Proxmox provider:
  - `PM_USER`
  - `PM_PASSWORD`
- Environment variable for Terraform Pihole provider:
  - `TF_VAR_pihole_password`
- Environment variable for Terraform Cloudflare provider:
  - `CLOUDFLARE_API_TOKEN`

## Usage

Here are some useful commands and scenarios to get started:

### Plan and apply

```bash
# Plan and apply all resources
terragrunt run-all plan
terragrunt run-all apply
```

```bash
# Plan and apply a single stack
cd stacks/<stack>
terragrunt plan
terragrunt apply
```

### Destroy

```bash
# Destroy all resources
terragrunt run-all destroy
```

```bash
# Destroy a single stack
cd stacks/<stack>
terragrunt destroy
```
