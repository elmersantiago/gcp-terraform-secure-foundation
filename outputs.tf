output "project_id" {
  description = "Google Cloud project ID"
  value       = var.project_id
}

output "vpc_name" {
  description = "Created VPC network name"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "Created subnet name"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_cidr" {
  description = "Subnet CIDR range"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}

output "vm_name" {
  description = "Compute Engine instance name"
  value       = google_compute_instance.vm.name
}

output "vm_internal_ip" {
  description = "Private IP address of the VM"
  value       = google_compute_instance.vm.network_interface[0].network_ip
}

output "vm_zone" {
  description = "Compute Engine deployment zone"
  value       = google_compute_instance.vm.zone
}
