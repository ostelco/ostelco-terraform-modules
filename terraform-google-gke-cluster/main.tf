/******************************************
  Get available zones in region
 *****************************************/
data "google_compute_zones" "available" {
  project = "${var.project_id}"
  region  = "${var.cluster_region}"
}

/******************************************
  Get available container engine versions
 *****************************************/
data "google_container_engine_versions" "region" {
  zone    = "${data.google_compute_zones.available.names[0]}"
  project = "${var.project_id}"
}

resource "random_shuffle" "available_zones" {
  input        = ["${data.google_compute_zones.available.names}"]
  result_count = 3
}

locals {
  kubernetes_version     = "${var.cluster_version != "latest" ? var.cluster_version : data.google_container_engine_versions.region.latest_node_version}"
  cluster_type = "${var.regional ? "regional" : "zonal"}"

  cluster_type_output_name = {
    regional = "${element(concat(google_container_cluster.regional_primary.*.name, list("")), 0)}"
    zonal    = "${element(concat(google_container_cluster.zonal_primary.*.name, list("")), 0)}"
  }
  cluster_type_output_master_auth = {
    regional = "${concat(google_container_cluster.regional_primary.*.master_auth, list())}"
    zonal    = "${concat(google_container_cluster.zonal_primary.*.master_auth, list())}"
  }

  cluster_type_output_endpoint = {
    regional = "${element(concat(google_container_cluster.regional_primary.*.endpoint, list("")), 0)}"
    zonal    = "${element(concat(google_container_cluster.zonal_primary.*.endpoint, list("")), 0)}"
  }

  cluster_name  = "${local.cluster_type_output_name[local.cluster_type]}"
  cluster_master_auth_list_layer1 = "${local.cluster_type_output_master_auth[local.cluster_type]}"
  cluster_master_auth_list_layer2 = "${local.cluster_master_auth_list_layer1[0]}"
  cluster_master_auth_map         = "${local.cluster_master_auth_list_layer2[0]}"
  cluster_ca_certificate      = "${lookup(local.cluster_master_auth_map, "cluster_ca_certificate")}"
  client_certificate      = "${lookup(local.cluster_master_auth_map, "client_certificate")}"
  client_key      = "${lookup(local.cluster_master_auth_map, "client_key")}" 
  cluster_endpoint            = "${local.cluster_type_output_endpoint[local.cluster_type]}"
}
