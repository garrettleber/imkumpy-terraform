# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "imkumpy-terraform-state"
    encrypt = true
    key     = "static-dns/terraform.tfstate"
    region  = "us-east-1"
  }
}
