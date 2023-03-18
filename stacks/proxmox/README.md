# imkumpy-terraform/proxmox

Env variables needed

```bash
AWS_ACCESS_KEY_ID # for remote backend
AWS_SECRET_ACCESS_KEY # for remote backend
PM_USER # proxmox user (see telmate/proxmox provider)
PM_PASS # proxmox pass (see telmate/proxmox provider)
CLOUDFLARE_API_TOKEN # for dns record creation (see cloudflare/cloudflare provider)
TF_VAR_pihole_password # for internal dns record creation (see ryanwholey/pihole provider)
```
