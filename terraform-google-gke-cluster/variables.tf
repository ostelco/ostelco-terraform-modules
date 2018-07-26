variable "cluster_username" {
  description = "cluster username."
  default     = "admin"
}

variable "cluster_password" {
  description = "password for the cluster username. Must be 16 characters at least."
}

variable "issue_client_certificate" {
  description = "whether to generate client certificate or not."
  default     = "true"
}

variable "cluster_name" {
  description = "cluster name."
}

variable "cluster_zone" {
  default     = "europe-west1-c"
  description = "The zone where the cluster will be created."
}

variable "cluster_region" {
  default     = "europe-west1"
  description = "The region where the cluster will be created."
}

variable "cluster_additional_zones" {
  type        = "list"
  description = "Additional zones to create the cluster in. This makes the cluster multizoned and improves availability."
  default     = []
}

variable "cluster_network" {
  default     = "default"
  description = "The network where the cluster will be created."
}

variable "cluster_subnetwork" {
  default     = "default"
  description = "The subnetwork where the cluster will be created."
}

variable "cluster_description" {
  description = "description of the cluster and its purpose."
}

variable "cluster_version" {
  description = "The k8s version of the cluster master and nodes."
  default     = "1.9.7-gke.3"
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
