resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  zone               = "${var.cluster_zone}"
  description        = "${var.cluster_description}"
  min_master_version = "${var.gke_version}"
  additional_zones   = "${var.additional_zones}"

  network    = "${var.network}"
  subnetwork = "${var.subnet}"

  initial_node_count = 1

  master_auth {
    username = "${var.master_username}"
    password = "${var.master_password}"
  }

  remove_default_node_pool = "true"
}
