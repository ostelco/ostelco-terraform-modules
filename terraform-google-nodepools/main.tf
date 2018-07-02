resource "google_container_node_pool" "np" {
  name       = "${var.node_pool_name}"
  zone       = "${var.cluster_zone}"
  cluster    = "${var.cluster_name}"
  node_count = "${var.node_pool_count}"

  node_config {

    oauth_scopes = "${var.oauth_scopes}"

    labels  = "${var.node_config_labels}"

    tags = "${var.node_config_tags}"

    machine_type = "${var.node_machine_type}"
  }
}