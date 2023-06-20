output "external_ip" {
  value = try(google_compute_instance.this.network_interface[0].access_config[0].nat_ip, "")
}

output "internal_ip" {
  value = try(google_compute_instance.this.network_interface[0].network_ip, "")
}