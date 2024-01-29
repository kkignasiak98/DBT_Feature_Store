locals {
  project  = "dbt-feature-store"
  region = "europe-central2"
}

inputs = {
  project = local.project
  region = local.region 
}


remote_state {
  backend = "gcs" # S3 or gcs bucket are suported
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt" 
  }
  config = {
    bucket = "terraform_state_bucket_2024_01_26"
    prefix  = "terraform/state"
  }
}

generate "providers" {
  path = "providers.tf"

  if_exists = "overwrite" # Overwrite file even if it was not previously created by terragrunt

    contents = <<EOF

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = "${local.project}"
  region      = "${local.region}"
}

EOF
}
