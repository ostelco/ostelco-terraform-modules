resource "google_container_cluster" "regional_primary" {
  count       = "${var.regional ? 1 : 0}"  
  name = "${var.cluster_name}"
  project = "${var.project_id}"

  description = "${var.cluster_description}"

  network                  = "${var.cluster_network}"
  subnetwork               = "${var.cluster_subnetwork}"
  min_master_version       = "${local.kubernetes_version}"
  remove_default_node_pool = "${var.remove_default_node_pool}"
  initial_node_count       = 1
  region                   = "${var.cluster_region}" 
  additional_zones         = ["${sort(random_shuffle.available_zones.result)}"]
  node_version             = "${local.kubernetes_version}"

  master_auth {
    username = "${var.cluster_username}"
    password = "${var.cluster_password}"

    client_certificate_config {
      issue_client_certificate = "${var.issue_client_certificate}"
    }
  }

  # The time is specified in 24H format and the time zone is GMT
  # The maintenance window is 4 hours from that time
  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.maintenance_start_time}" # GMT time
    }
  }

  addons_config {
    kubernetes_dashboard {
      disabled = "${var.disable_dashboard}"
    }

    horizontal_pod_autoscaling {
      disabled = "${var.disable_horizontal_pod_autoscaling}"
    }

    http_load_balancing {
      disabled = "${var.disable_http_load_balancing}"
    }

    network_policy_config {
      disabled = "${var.disable_network_policy_config}"
    }
  }

  # If enabled, pods will only be created if they are valid under a PodSecurityPolicy
  pod_security_policy_config {
    enabled = "${var.pod_security_policy}"
  }

  # changes on "initial_node_count" and "network_policy_config" are ignored during terraform plan
  lifecycle {
    ignore_changes = ["initial_node_count", "addons_config.0.network_policy_config"]
    create_before_destroy = true
  }

  # depending on the cluster and node pool sizes, it may take longer time to complete provisioning/updating/destruction. Thus, the long time outs.
  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}