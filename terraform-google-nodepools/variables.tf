##
## Node pools variables
##

variable "node_config_labels" {
  type        = "map"
  description = "node config labels"
}

variable "node_config_tags" {
  type        = "list"
  description = "node config tags"
}


variable "node_pool_name" {
  description = "Name of the node pool"
}

variable "node_pool_count" {
  description = "Node pool count"
  default     = "1"
}

variable "node_machine_type" {
  description = "Node machine type"
  default     = "n1-standard-1"
}

variable "cluster_name" {
  description = "Node machine type"
}

variable "cluster_zone" {
  description = "The zone where the cluster will be created."
}

variable "oauth_scopes" {
  type        = "list"
  default     = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring"]
}
