output "composer_network_ID" {
  value = google_compute_network.composer_network.id
}


output "composer_sub_network_ID" {
  value = google_compute_subnetwork.composer_subnetwork.id
}