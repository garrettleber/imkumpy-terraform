# Terraform DNS MX Module

This module creates DNS records required for a mail server using Cloudflare as the DNS provider.

This module creates the following resources:

1. A Record for external IP address of the Mail Server's FQDN
2. MX Record pointing to the newly created A record
3. SPF Record for email authentication
4. DKIM Record for email authentication
5. DMARC Record for email authentication

## Usage

To use this module, add the following code to your Terraform configuration:

```
module "dns_mx" {
  source            = "github.com/your-repo/dns-mx"
  cloudflare_zone_id = var.cloudflare_zone_id
  external_domain    = var.external_domain
  external_ip        = var.external_ip
  dkim_record        = var.dkim_record
}
```

Then run `terraform apply` and it will generate all the necessary DNS records for your mail server.

## Inputs

This module requires the following inputs:

- `cloudflare_zone_id`: The ID of the Cloudflare DNS zone
- `external_domain`: The external domain of the mail server
- `external_ip`: The external IP address of the mail server
- `dkim_record`: The DKIM record for email authentication

## Outputs

This module does not have any outputs.
