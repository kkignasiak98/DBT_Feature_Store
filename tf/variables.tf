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

variable "bq_data_location" {
  type        = string
  default     = "UE"
  description = "The location for BigQuery data"
}

# API
variable "api_list" {
  type    = list(string)
  default = ["compute.googleapis.com", "iam.googleapis.com", "storage-component.googleapis.com"]
}