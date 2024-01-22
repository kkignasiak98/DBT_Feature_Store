variable project_ID {
  type        = string
  default     = ""
  description = "the GCP project"
}

variable "api_list" {
  type    = list(string)
  default = ["compute.googleapis.com", "iam.googleapis.com","storage-component.googleapis.com"]
}