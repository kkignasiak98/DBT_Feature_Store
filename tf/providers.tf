terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

}
provider "google" {
  project = var.project_ID
  region  = var.resource_location
}