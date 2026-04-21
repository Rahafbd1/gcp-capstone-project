resource "google_compute_health_check" "http" {
  name = "ci-health-check"

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "backend" {
  name                  = "ci-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
  health_checks        = [google_compute_health_check.http.id]
}

resource "google_compute_url_map" "urlmap" {
  name            = "ci-url-map"
  default_service = google_compute_backend_service.backend.id
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = "ci-http-proxy"
  url_map = google_compute_url_map.urlmap.id
}

resource "google_compute_global_forwarding_rule" "rule" {
  name       = "ci-http-rule"
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}
