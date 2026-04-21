resource "google_compute_subnetwork" "public" {
  name          = "ci-public-subnet"
  ip_cidr_range = "10.10.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private" {
  name          = "ci-private-subnet"
  ip_cidr_range = "10.10.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.id
}
