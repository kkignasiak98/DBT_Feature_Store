resource "google_compute_network" "composer_network" {
  name                    = "composer-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "composer_subnetwork" {
  name          = "composer-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.resource_location
  network       = google_compute_network.composer_network.id
}
