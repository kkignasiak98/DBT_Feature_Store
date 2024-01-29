resource_location = "europe-central2"
project_ID        = "dbt-feature-store"
bq_data_location  = "EU"


# API

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