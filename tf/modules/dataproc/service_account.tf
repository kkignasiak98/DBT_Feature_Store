resource "google_project_iam_member" "dataproc-main-service-account" {

  for_each = toset([
    "roles/storage.objectUser",
    "roles/storage.insightsCollectorService"
  ])
  project = var.project_ID
  role    = each.key
  member  = "serviceAccount:774824789705-compute@developer.gserviceaccount.com"
}