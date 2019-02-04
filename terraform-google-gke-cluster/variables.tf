variable "project_id" {
  description = "Google cloud project ID"
}
variable "regional" {
  description = "whether the cluster should be created in multiple zones or not."
  default = false
}

variable "cluster_username" {
  description = "cluster username."
  default     = "admin"
}

variable "cluster_password" {
  description = "password for the cluster username. Must be 16 characters long at least."
}

variable "issue_client_certificate" {
  description = "whether to generate client certificate or not."
  default     = "true"
}

variable "cluster_name" {
  description = "cluster name."
}

variable "cluster_zones" {
  type = "list"
  default     = [""]
  description = "The zone where the cluster will be created. Required for zonal clusters only."
}

variable "cluster_region" {
  default     = "europe-west1"
  description = "The region where the cluster will be created."
}

variable "cluster_network" {
  default     = "default"
  description = "The network (VPC) where the cluster will be created."
}

variable "cluster_subnetwork" {
  default     = "default"
  description = "The subnetwork where the cluster will be created."
}

variable "cluster_description" {
  description = "description of the cluster and its purpose."
}

variable "cluster_version" {
  description = "The k8s version of the cluster master and nodes. You can use 'latest' to have the latest availble version in the specified region. "
  default     = "latest"
}

variable "pod_security_policy" {
  description = "If enabled, pods will only be created if they are valid under a PodSecurityPolicy"
  default     = "false"
}

variable "maintenance_start_time" {
  description = "The start time for maintenance in GMT. Format is 24H e.g. 00:00. The maintenance window is 4 hours from the start time."
  default     = "00:00"
}

variable "disable_dashboard" {
  description = "Whether Kubernetes dashboard is to be disabled or not."
  default     = "true"
}

variable "disable_http_load_balancing" {
  description = "Whether http (L7) load balancing is to be disabled or not."
  default     = "false"
}

variable "disable_network_policy_config" {
  description = "Whether network policy addon in the cluster is to be disabled or not."
  default     = "false"
}

variable "disable_horizontal_pod_autoscaling" {
  description = "Whether horizontal pod autoscaling (and heapster metrics) is to be disabled or not."
  default     = "false"
}

variable "remove_default_node_pool" {
  description = "Whether to delete the default node pool (contains 1 node) or not."
  default     = "true"
}
