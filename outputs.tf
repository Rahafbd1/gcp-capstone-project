output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "vm1_ip" {
  value = google_compute_instance.app1.network_interface[0].network_ip
}

output "vm2_ip" {
  value = google_compute_instance.app2.network_interface[0].network_ip
}

output "lb_ip" {
  value = google_compute_global_forwarding_rule.rule.ip_address
}
