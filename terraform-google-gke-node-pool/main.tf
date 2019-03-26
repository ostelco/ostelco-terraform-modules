/******************************************
  Get available zones in region
 *****************************************/
data "google_compute_zones" "available" {
  project = "${var.project_id}"
  region  = "${var.cluster_region}"
}

resource "random_id" "np_name" {
  keepers = {
    name = "${var.node_pool_name}"
  }
  byte_length = 5
}

resource "google_container_node_pool" "zonal_np" {
  provider = "google-beta"
  count       = "${var.regional ? 0 : 1}"
  name = "${var.node_pool_name}_${random_id.np_name.b64_url}"
  project = "${var.project_id}"

  # the line below can't be used together with node_count
  initial_node_count = "${var.initial_node_pool_size}" 
  # these should not be used with Auto scaling
  # node_count = "${var.node_count}"
  zone       = "${var.node_pool_zone == "" ? data.google_compute_zones.available.names[0] : var.node_pool_zone}"

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
    disk_type = "${var.pool_node_disk_type}"
    disk_size_gb = "${var.pool_node_disk_size_gb}"
    machine_type = "${var.pool_node_machine_type}"

    # tags are applied to each cluster node
    tags = "${var.node_tags}"

    # taints are applied to each cluster node
    taint = "${var.node_taints}"

    # kubernetes lables (key/value pairs)
    labels = "${var.node_labels}"
    workload_metadata_config {
      node_metadata = "${var.node_metadata}"
    }
  }

  lifecycle {
    ignore_changes = ["initial_node_count"]
    create_before_destroy = true
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

resource "google_container_node_pool" "regional_np" {
  provider = "google-beta"
  count       = "${var.regional ? 1 : 0}"
  name = "${var.node_pool_name}_${random_id.np_name.b64_url}"
  project = "${var.project_id}"

  # the line below can't be used together with node_count
  initial_node_count = "${var.initial_node_pool_size}" 
  # these should not be used with Auto scaling
  # node_count = "${var.node_count}"
  region     = "${var.cluster_region}"

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
    disk_type = "${var.pool_node_disk_type}"
    disk_size_gb = "${var.pool_node_disk_size_gb}"
    machine_type = "${var.pool_node_machine_type}"

    # tags are applied to each cluster node
    tags = "${var.node_tags}"

    # taints are applied to each cluster node
    taint = "${var.node_taints}"

    # kubernetes lables (key/value pairs)
    labels = "${var.node_labels}"
    workload_metadata_config {
      node_metadata = "${var.node_metadata}"
    }
  }

  lifecycle {
    ignore_changes = ["initial_node_count"]
    create_before_destroy = true
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
