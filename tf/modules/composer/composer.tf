
resource "google_composer_environment" "cloud_composer_prod" {
  name    = "composer-env-tf-c2"
  region  = var.resource_location
  project = var.project_ID
  config {

    software_config {
      image_version = "composer-2.5.4-airflow-2.6.3" # Optional in Cloud Composer 1 required in Cloud Composer 2
      # Encapsulate both the version of Cloud Composer and the Apache Airflow
      # List of images https://cloud.google.com/composer/docs/concepts/versioning/composer-versions
      # Inplace update only in google-beta provider

      airflow_config_overrides = {
        # Setting default secret backend to Google Secret Manager
        secrets-backend        = "airflow.providers.google.cloud.secrets.secret_manager.CloudSecretManagerBackend"
        secrets-backend-kwargs = jsonencode({ "project_id" : "var.project_ID", "variables_prefix" : "airflow-variables", "sep" : "-", "connections_prefix" : "airflow-connections" })
      }

    }
    workloads_config {
      scheduler {
        cpu        = 0.5
        memory_gb  = 2
        storage_gb = 1
        count      = 1
      }
      web_server {
        cpu        = 0.5
        memory_gb  = 2.0
        storage_gb = 1
      }
      worker {
        cpu        = 0.5
        memory_gb  = 2
        storage_gb = 1
        min_count  = 1
        max_count  = 1
      }
    }

    private_environment_config {
      enable_private_endpoint = true
     # master_ipv4_cidr_block  = var.master_ipv4_cidr_block
     # cloud_composer_connection_subnetwork = "projects/${var.your_gcp_host_project}/regions/${var.region}/subnetworks/${var.your_shared_vpc_network_name}"
    }

    node_config {
      network    = var.network_ID
      subnetwork = var.sub_network_ID
    #  service_account = google_service_account.test.name
    }
    environment_size = "ENVIRONMENT_SIZE_SMALL"
  }

  
}
