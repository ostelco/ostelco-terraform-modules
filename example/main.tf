variable "project_name" {
  description = "Google Cloud project ID."
}

variable "cluster_region" {
  default     = "europe-west1"
  description = "The region where the cluster will be created."
}

variable "cluster_zone" {
  default     = "europe-west1-c"
  description = "The zone where the cluster will be created."
}

variable "cluster_admin_password" {
  description = "password for cluster admin. Must be 16 characters at least."
}

# Configure the Google Cloud provider
provider "google" {
  project = "${var.project_name}"
  region  = "${var.cluster_region}"
}

module "gke" {
  #   source = "../terraform-google-gke-cluster"
  source              = "github.com/ostelco/ostelco-terraform-modules//terraform-google-gke-cluster"
  cluster_password    = "${var.cluster_admin_password}"
  cluster_name        = "dev-cluster"
  cluster_description = "Development cluster."
  cluster_version     = "1.9.7-gke.3"
  cluster_zone        = "${var.cluster_zone}"

  # the line below makes the cluster multizone (regional)
  #cluster_additional_zones = ["europe-west1-b"]
}

module "np" {
  #   source = "../terraform-google-gke-node-pool"
  source         = "github.com/ostelco/ostelco-terraform-modules//terraform-google-gke-node-pool"
  cluster_name   = "${module.gke.cluster_name}"
  node_pool_zone = "${module.gke.cluster_zone}"

  node_pool_name = "small-nodes-pool"

  node_tags  = ["dev"]

  node_labels = {
    "env"         = "dev"
    "machineType" = "n1-standard-1"
  }
}

output "dev_cluster_endpoint" {
  value = "${module.gke.cluster_endpoint}"
}

output "dev_cluster_client_certificate" {
  value = "${module.gke.cluster_client_certificate}"
}

output "dev_cluster_client_key" {
  value = "${module.gke.cluster_client_key}"
}

output "dev_cluster_ca_certificate" {
  value = "${module.gke.cluster_ca_certificate}"
}

# the backend config for storing terraform state in GCS 
# requires setting GOOGLE_CREDNETIALS to contain the path to your Google Cloud service account json key.
terraform {
  backend "gcs" {
    bucket = "your-terraform-state"
    prefix = "cluster/state"
  }
}
