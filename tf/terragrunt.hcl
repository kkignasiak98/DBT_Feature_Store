locals {
  var_location = "${get_parent_terragrunt_dir()}/common.tfvars"
  inputs_from_tfvars = jsondecode(read_tfvars_file(local.var_location))

  project_ID          = local.inputs_from_tfvars.project_ID
  resource_location   = local.inputs_from_tfvars.resource_location


  # Terraform cloud variables
  tfc_hostname = "app.terraform.io" # For TFE, substitute the custom hostname for your TFE host
  tfc_organization = "kkignasiak-code-miracles"
  tfc_project      = "DBT_FEATURE_STORE"
  workspace        = reverse(split("/", get_terragrunt_dir()))[0] # This will find the name of the module, such as "vpc"
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    # additional inputs
  }
)

generate "remote_state" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "${local.tfc_hostname}"
    organization = "${local.tfc_organization}"
    workspaces {
      name = "${local.tfc_project}-${local.workspace}"
    }
  }
}
EOF
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
