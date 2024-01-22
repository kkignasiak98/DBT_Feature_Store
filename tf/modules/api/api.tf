resource "google_project_service" "enabled_services" {
  project = var.project_ID  

  for_each = toset(var.api_list)

  service = each.key
}