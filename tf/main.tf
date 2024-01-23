module "api" {
  source     = "./modules/api"
  project_ID = var.project_ID
  api_list   = var.api_list
}

module "composer" {
    source     = "./modules/composer"
    project_ID = var.project_ID
    resource_location = var.resource_location
}
