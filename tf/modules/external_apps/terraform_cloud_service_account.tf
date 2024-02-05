resource "google_service_account" "service_account_terraform_cloud" {
  account_id   = "tfc20240202"
  display_name = "Service account for Terraform cloud"
}

resource "google_project_iam_member" "job_user_and_data_editor_dbt" {

  project = var.project_ID

  role    = "roles/owner"
  member  = google_service_account.service_account_terraform_cloud.member
}