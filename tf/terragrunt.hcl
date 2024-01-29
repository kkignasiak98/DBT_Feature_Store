locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("/workspaces/DBT_Feature_Store/tf/common.tfvars"))

  project_ID          = local.inputs_from_tfvars.project_ID
  resource_location   = local.inputs_from_tfvars.resource_location 
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    # additional inputs
  }
)


remote_state {
  backend = "gcs" # S3 or gcs bucket are suported
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt" 
  }
  config = {
    bucket = "terraform_state_bucket_2024_01_26"
    prefix  = path_relative_to_include()
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
  project     = "${local.project_ID}"
  region      = "${local.resource_location}"
}

EOF
}
