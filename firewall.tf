resource "google_compute_firewall" "http_https" {
  name    = "allow-http-https"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "all"
  }

  source_ranges = ["10.10.0.0/16"]
}

resource "google_compute_firewall" "iap" {
  name    = "allow-iap-ssh"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}
