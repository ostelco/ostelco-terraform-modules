# Google GKE node pool Terraform module

Used to create a Kubernetes node pool in Google Kubernetes Engine (GKE).


## Input variables

| variable               | description                                                                                                                                       | default       |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| cluster_name           | cluster name to which this node pool will be associated.                                                                                          |               |
| node_pool_zone         | the zone where the node pool is located.                                                                                                          |               |
| auto_repair            | whether to enable auto repair on the pool nodes or not.                                                                                           | true          |
| auto_upgrade           | whether to enable automatic kubernetes version upgrades on nodes or not.                                                                          | false         |
| node_pool_name         | the node pool name.                                                                                                                               |               |
| initial_node_pool_size | the initial size of the cluster node pool.                                                                                                        | 2             |
| pool_min_node_count    | the minimum number of nodes in the node pool.                                                                                                     | 1             |
| pool_max_node_count    | the maximum number of nodes in the node pool.                                                                                                     | 3             |
| pool_node_disk_size_gb | the disk size (in GB) for nodes in the cluster node pool.                                                                                         | 100           |
| pool_node_machine_type | the machine type for nodes in the node pool.                                                                                                      | n1-standard-1 |
| node_tags              | list of tags to be applied all nodes in the pool.                                                                                                 |               |
| node_taints            | list of k8s taints to apply to each node in node pools. Check [K8S docs](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) | []            |
| node_labels            | map of key/value K8S labels to be applied to all nodes in this pool.                                                                              |               |


## Output variables

None.