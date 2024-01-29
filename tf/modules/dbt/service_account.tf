locals {
  project = var.project_ID
}

resource "google_service_account" "service_account_dbt" {
  account_id   = "dbt20240124"
  display_name = "Dbt service account"
}

resource "google_project_iam_member" "job_user_and_data_editor_dbt" {

  project = local.project
  for_each = toset([
    "roles/bigquery.jobUser",
    "roles/bigquery.dataEditor",
  ])

  role    = each.key
  member  = google_service_account.service_account_dbt.member
}