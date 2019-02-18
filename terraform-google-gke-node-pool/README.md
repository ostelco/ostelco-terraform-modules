# Google GKE node pool Terraform module

> Since this module uses `beta` features in Google Cloud, it needs to use the `google-beta` terraform provider. More details [here](https://www.terraform.io/docs/providers/google/provider_versions.html).

Used to create a Kubernetes node pool in Google Kubernetes Engine (GKE).

This module can create zonal or regional node pools. See usage examples in the [examples folder](../example)

## Input variables

| variable               | description                                                                                                                                       | default       |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| project_id           | Google cloud project ID.                                                                                          |                  |
| regional           |   whether the cluster should be created in multiple zones or not.                                                                             |    false    |
| cluster_region           |   The region in which the cluster resides (required for regional clusters). This property is in beta, and should be used with the terraform-provider-google-beta provider.                                                                             |        |
| cluster_name           | cluster name to which this node pool will be associated.                                                                                          |               |
| node_pool_zone         | the zone where the node pool is located (required for zonal node pools only).                                                                                                          |               |
| auto_repair            | whether to enable auto repair on the pool nodes or not.                                                                                           | true          |
| auto_upgrade           | whether to enable automatic kubernetes version upgrades on nodes or not.                                                                          | false         |
| node_pool_name         | the node pool name.                                                                                                                               |               |                                                                                                        | 2             |
| initial_node_pool_size | initial node pool size | 2
| pool_min_node_count    | the minimum number of nodes in the node pool. This is used for autoscaling.                                                                                                     | 1             |
| pool_max_node_count    | the maximum number of nodes in the node pool. This is used for autoscaling.                                                                                                     | 3             |
| pool_node_disk_size_gb | the disk size (in GB) for nodes in the cluster node pool.                                                                                         | 100           |
| pool_node_disk_type | Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd').                                                                               |   pd-standard    |
| pool_node_machine_type | the machine type for nodes in the node pool.                                                                                                      | n1-standard-1 |
| oauth_scopes           | list of Google API scopes that are available for nodes in a pool.  |  "https://www.googleapis.com/auth/compute",<br/>"https://www.googleapis.com/auth/devstorage.read_only",<br/>"https://www.googleapis.com/auth/logging.write",<br/>"https://www.googleapis.com/auth/monitoring" |
| node_tags              | list of tags to be applied all nodes in the pool.                                                                                                 |               |
| node_taints            | list of k8s taints to apply to each node in node pools. Check [K8S docs](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) | []            |
| node_labels            | map of key/value K8S labels to be applied to all nodes in this pool.                                                                              |               |
| node_metadata            | How to expose the node metadata to the workload running on the node. Can either be: `SECURE`, `UNSPECIFIED`, `EXPOSE`                                      |       SECURE        |


## Output variables

None.