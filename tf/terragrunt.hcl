locals {
  project_ID          = "dbt-feature-store"
  resource_location   = "europe-central2"
}

inputs = {
  project_ID  = local.project_ID 
  resource_location = local.resource_location
  bq_data_location = "EU"

  api_list = [
  # Standard
  "compute.googleapis.com",
  "iam.googleapis.com",
  "storage-component.googleapis.com",
  "cloudresourcemanager.googleapis.com",

  # Big Query
  "bigquery.googleapis.com",
  "bigquerystorage.googleapis.com",

  # Vertex AI
  "aiplatform.googleapis.com",
  "notebooks.googleapis.com",

  # Data services
  "dataflow.googleapis.com",
  "dataproc.googleapis.com",
  "metastore.googleapis.com",

  # Apache Airflow
  "cloudscheduler.googleapis.com",
  "composer.googleapis.com",

  # DevOps
  "containerregistry.googleapis.com",
  "secretmanager.googleapis.com",

  # Services
  "run.googleapis.com"

]
}


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
