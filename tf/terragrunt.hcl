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