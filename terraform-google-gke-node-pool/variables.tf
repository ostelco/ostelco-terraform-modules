variable "cluster_name" {
  description = "cluster name to which this node pool will be associated."
}

variable "node_pool_zone" {
  description = "The zone where the node pool is located."
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

variable "node_pool_count" {
  default     = 2
  description = "The initial size of the cluster node pool."
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

variable "pool_node_machine_type" {
  default     = "n1-standard-1"
  description = "The machine type for nodes in the node pool."
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
