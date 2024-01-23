
resource "google_project_iam_member" "project" {
  project = var.project_ID
  role    = "roles/composer.ServiceAgentV2Ext"
  member  = "serviceAccount:774824789705-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "project-composer" {
  project = var.project_ID
  role    = "roles/composer.ServiceAgentV2Ext"
  member  = "serviceAccount:service-774824789705@cloudcomposer-accounts.iam.gserviceaccount.com"
}