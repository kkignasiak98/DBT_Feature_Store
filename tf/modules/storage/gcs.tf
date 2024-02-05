resource "google_storage_bucket" "terraform_state_bucket" {
  name          = "terraform_state_bucket_2024_01_26"
  location      = var.resource_location
  force_destroy = false
  versioning {
    enabled = true
  }
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
}