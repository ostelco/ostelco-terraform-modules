output "cluster_name" {
  value       = "${local.cluster_name}"
  description = "Cluster name."
}

output "cluster_zone" {
  value       = "${var.cluster_zones}"
  description = "Cluster zone(s)."
}

output "cluster_endpoint" {
  sensitive   = true
  value       = "${local.cluster_endpoint}"
  description = "Cluster endpoint."
}

output "cluster_client_certificate" {
  sensitive   = true
  value       = "${local.client_certificate}"
  description = "Base64 encoded public certificate used by clients to authenticate to the cluster endpoint."
}

output "cluster_client_key" {
  sensitive   = true
  value       = "${local.client_key}"
  description = "Base64 encoded private key used by clients to authenticate to the cluster endpoint."
}

output "cluster_ca_certificate" {
  sensitive   = true
  value       = "${local.cluster_ca_certificate}"
  description = "Base64 encoded public certificate that is the root of trust for the cluster."
}
