resource "google_compute_instance" "app1" {
  name         = "ci-app-1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt update
    apt install nginx -y
    systemctl start nginx
    systemctl enable nginx
  EOT
}

resource "google_compute_instance" "app2" {
  name         = "ci-app-2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt update
    apt install nginx -y
    systemctl start nginx
    systemctl enable nginx
  EOT
}
