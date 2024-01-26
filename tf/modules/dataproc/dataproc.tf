
resource "google_dataproc_cluster" "main_cluster" {
  name     = "main-cluster"
  region   = var.resource_location
  graceful_decommission_timeout = "120s"
 

  cluster_config {
#    staging_bucket = "dataproc-staging-bucket20240124" # It is optional, but if not specified the auto created/assigned bucket might be share with other clusters.

    master_config {
      num_instances = 1
      machine_type  = "n2-standard-2"
      disk_config {
        boot_disk_type    = "pd-standard"
        boot_disk_size_gb = 30
        num_local_ssds    = 1
      }
    }

    worker_config {
      num_instances    = 0 # must be 2 or more
      machine_type     = "e2m-micro"
      min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_size_gb = 15
        num_local_ssds    = 1
      }
    }

    preemptible_worker_config {
      num_instances = 0
    }

    # Override or set some custom properties
    software_config {
      image_version = "2.2-ubuntu22"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }
  }
}