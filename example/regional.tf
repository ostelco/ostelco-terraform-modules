
variable "project_id" {
  description = "Google Cloud project ID."
}

variable "regional" {
  description = "whether the cluster should be created in multiple zones or not."
  default = true
}

variable "cluster_region" {
  default     = "europe-west1"
  description = "The region where the cluster will be created."
}

variable "cluster_admin_password" {
  description = "password for cluster admin. Must be 16 characters at least."
  default = "thisIsA16CharsTestPassword"
}

# Configure the Google Cloud provider
provider "google-beta" {
  project = "${var.project_id}"
  region  = "${var.cluster_region}"
}

module "gke" {
  source = "../terraform-google-gke-cluster"
  #source              = "github.com/ostelco/ostelco-terraform-modules//terraform-google-gke-cluster"
  project_id            = "${var.project_id}"
  cluster_password      = "${var.cluster_admin_password}"
  cluster_name          = "test-cluster"
  cluster_description   = "test cluster."
  cluster_version       = "latest"
  regional              = "${var.regional}"

}

module "np" {
  source = "../terraform-google-gke-node-pool"
  #source         = "github.com/ostelco/ostelco-terraform-modules//terraform-google-gke-node-pool"
  project_id     = "${var.project_id}"
  regional       = "${var.regional}"
  cluster_name   = "${module.gke.cluster_name}" # creates implicit dependency
  cluster_region = "${var.cluster_region}"
#   node_pool_zone = "${var.cluster_zones[0]}"

  node_pool_name = "small-nodes-pool"

  node_tags  = ["dev"]

  node_labels = {
    "env"         = "dev"
    "machineType" = "n1-standard-1"
  }
}

output "dev_cluster_endpoint" {
  sensitive = true
  value = "${module.gke.cluster_endpoint}"
}

output "dev_cluster_client_certificate" {
  sensitive = true
  value = "${module.gke.cluster_client_certificate}"
}

output "dev_cluster_client_key" {
  sensitive = true
  value = "${module.gke.cluster_client_key}"
}

output "dev_cluster_ca_certificate" {
  sensitive = true
  value = "${module.gke.cluster_ca_certificate}"
}

# the backend config for storing terraform state in GCS 
# requires setting GOOGLE_CREDNETIALS to contain the path to your Google Cloud service account json key.
# terraform {
#   backend "gcs" {
#     bucket = "your-terraform-state"
#     prefix = "cluster/state"
#   }
# }
