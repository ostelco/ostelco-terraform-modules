##
## Cluster variables
##

variable "project_name" {
  description = "The name of the project."
}

variable "cluster_name" {
  description = "cluster name."
}

variable "cluster_region" {
  description = "The region where the cluster will be created."
}

variable "cluster_zone" {
  description = "The zone where the cluster will be created."
}

variable "cluster_description" {
  description = "Description of the cluster and its purpose."
}

variable "gke_version" {
  description = "The version of GKE to be used by the nodes."
  default     = "1.10.5-gke.0"
}

variable "master_username" {
  description = "Master username"
  default     = "admin"
}

variable "master_password" {
  description = "Master password"
}

variable "network" {
  description = "Name of the network (VPC)"
  default     = "default"
}

variable "subnet" {
  description = "Name of the subnet"
  default     = "default"
}

variable "additional_zones" {
  type        = "list"
  description = "Additional zones for this cluster"
  default     = []
}
