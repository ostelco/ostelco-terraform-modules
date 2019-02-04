variable "project_id" {
  description = "Google cloud project ID"
}

variable "regional" {
  description = "whether the cluster should be created in multiple zones or not."
  default = false
}

variable "cluster_region" {
  description = "The region in which the cluster resides (required for regional clusters). This property is in beta, and should be used with the terraform-provider-google-beta provider."  
}

variable "cluster_name" {
  description = "cluster name to which this node pool will be associated."
}

variable "node_pool_zone" {
  description = "The zone where the node pool is located."
  default = ""
}

variable "auto_repair" {
  description = "Whether to enable auto repair on the pool nodes or not"
  default     = "true"
}

variable "auto_upgrade" {
  description = "Whether to enable automatic node upgrades or not."
  default     = "false"
}

variable "node_pool_name" {
  description = "The node pool name."
}

variable "initial_node_pool_size" {
  description = "initial node pool size"
  default = 2
}

variable "pool_min_node_count" {
  default     = 1
  description = "The minimum number of nodes in the node pool."
}

variable "pool_max_node_count" {
  default     = 3
  description = "The maximum number of nodes in the node pool."
}

variable "pool_node_disk_size_gb" {
  default     = 100
  description = "The disk size for nodes in the cluster node pool."
}

variable "pool_node_disk_type" {
  description = "Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd')."
  default = "pd-standard"
}


variable "pool_node_machine_type" {
  default     = "n1-standard-1"
  description = "The machine type for nodes in the node pool."
}

variable "oauth_scopes" {
  type = "list"
  description = "list of Google API scopes that are available for nodes in a pool."
  default = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
}


variable "node_tags" {
  type        = "list"
  description = "list of tags to be applied all nodes in the pool."
}

variable "node_taints" {
  type        = "list"
  description = "list of k8s taints to apply to each node in node pools. https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/"
  default     = []
}

variable "node_labels" {
  type        = "map"
  description = "map of key/value labels to be applied to all nodes in this pool."
}

variable "node_metadata" {
  description = "How to expose the node metadata to the workload running on the node."
  default = "SECURE"  
}