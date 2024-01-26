variable "resource_location" {
  type        = string
  default     = "europe-central2"
  description = "the GCP region in which the resources should be created"
}

variable "project_ID" {
  type        = string
  default     = ""
  description = "the GCP project"
}