# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "kkignasiak-code-miracles"
    workspaces {
      name = "DBT_FEATURE_STORE-dataproc"
    }
  }
}
