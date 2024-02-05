variable "resource_location" {
  type        = string
  default     = "us-west1"
  description = "the GCP region in which the resources should be created"
}

variable "project_ID" {
  type        = string
  default     = ""
  description = "the GCP project"
}

variable "network_ID" {
  type        = string
  default     = ""
  description = "The Id of the VPC network for cloud composer"
}


variable "sub_network_ID" {
  type        = string
  default     = ""
  description = "The Id of the sub_network for cloud composer"
}