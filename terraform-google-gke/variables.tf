
##
## Cluster variables
##


variable "project_name" {
  type        = "string"
  description = "pantel-tests"
  default     = "pantel-tests"

}

variable "cluster_name" {
  default     = "rmz-test-k8s"
  type        = "string"
  description = "cluster name."
}

variable "cluster_region" {
  default     = "europe-west1"
  type        = "string"
  description = "The region where the cluster will be created."
}

variable "cluster_zone" {
  default     = "europe-west1-b"
  type        = "string"
  description = "The zone where the cluster will be created."
}

variable "cluster_description" {
  type        = "string"
  description = "description of the cluster and its purpose."
  default     = "Test cluster"
}

variable "node_pool_name" {
  type        = "string"
  description = "Node of the node pool"
  default     = "rmz-node-pool"
}

variable "node_pool_count" {
  description = "Number of nodes in node pool"
  default     = "3"
}


variable "cluster_initial_node_count" {
 description = "The initial number of nodes in the cluster"
 default     = 2
}
