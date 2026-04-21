resource "google_compute_network" "vpc" {
  name                    = "ci-vpc-prod"
  auto_create_subnetworks = false
}
