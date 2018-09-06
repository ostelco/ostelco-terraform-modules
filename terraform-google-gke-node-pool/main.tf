resource "google_container_node_pool" "np" {
  name = "${var.node_pool_name}"

  #initial_node_count = "${var.initial_node_pool_size}" # can't be used together with node_count
  node_count = "${var.node_count}"
  zone       = "${var.node_pool_zone}"

  cluster = "${var.cluster_name}"

  management {
    auto_repair  = "${var.auto_repair}"
    auto_upgrade = "${var.auto_upgrade}"
  }

  autoscaling {
    min_node_count = "${var.pool_min_node_count}"
    max_node_count = "${var.pool_max_node_count}"
  }

  node_config {
    oauth_scopes = "${var.oauth_scopes}"
    disk_size_gb = "${var.pool_node_disk_size_gb}"
    machine_type = "${var.pool_node_machine_type}"

    # tags are applied to each cluster node
    tags = "${var.node_tags}"

    # taints are applied to each cluster node
    taint = "${var.node_taints}"

    # kubernetes lables (key/value pairs)
    labels = "${var.node_labels}"
  }
}
