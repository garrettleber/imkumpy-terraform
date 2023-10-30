# imkumpy-terraform

A repo to manage my self-hosted resources via Terraform

## CI/CD

This repo uses [Atlantis](https://www.runatlantis.io/) to manage CI/CD. Atlantis is a tool for Terraform that provides a workflow for collaborating on Terraform through pull requests. It is deployed as a Docker stack on my Portainer instance. You can see the configuration in the [portainer-stacks](https://github.com/tcpkump/portainer-stacks) repo.

## Requirements (if not using Atlantis)

- [Terraform](https://www.terraform.io/downloads.html) 1.4.0+
- [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) 0.44.0+
- Environment variables for Terraform AWS remote state:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - Alternatively, you can use the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) to configure your credentials
- Environment variables for Terraform Proxmox provider:
  - `PM_USER`
  - `PM_PASSWORD`
- Environment variable for Terraform Pihole provider:
  - `TF_VAR_pihole_password`
- Environment variable for Terraform Cloudflare provider:
  - `CLOUDFLARE_API_TOKEN`

## Workflow

**NOTE: This workflow only works on my private self-hosted git server, not on Github.** The Github repo is simply a mirror of my local repository.

1. Clone this repo
2. Checkout a new branch
3. Make your changes
4. Push your branch
5. Open a pull request
6. Wait for CI/CD to run, which will automatically run a `plan` on your changes.
7. If the `plan` is successful, you can tell Atlantis to apply your changes by commenting `atlantis apply` on your pull request.
8. Merge your pull request
