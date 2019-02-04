# Google GKE cluster Terraform module

Used to create a Kubernetes cluster in Google Kubernetes Engine (GKE).

This module can create zonal or regional clusters. See usage examples in the [examples folder](../example)

## Input variables 

| variable                           | description                                                                                                            | default        |
|------------------------------------|------------------------------------------------------------------------------------------------------------------------|----------------|
| project_id                   | Google cloud project ID.                                                                                                      |                |
| regional                   | whether this is a regional (HA) cluster                                                                                                      |         false       |
| cluster_username                   | cluster username.                                                                                                      |       admin         |
| cluster_password                   | password for the cluster username. Must be 16 characters long at least.                                                     |                |
| issue_client_certificate           | whether to generate client certificate or not.                                                                         | true           |
| cluster_name                       | cluster name.                                                                                                          |                |
| cluster_zones                       | the list of zones where the cluster will be created. If cluster is zonal, the first zone in the list is used.                                                                            | [""] |
| cluster_region                     | the region where the cluster will be created.                                                                          | europe-west1   |
| cluster_network                    | the network (VPC) where the cluster will be created.                                                                         | default        |
| cluster_subnetwork                 | the subnetwork where the cluster will be created.                                                                      | default        |
| cluster_description                | description of the cluster and its purpose.                                                                            |                |
| cluster_version                    | the k8s version of the cluster master and nodes. You can use `latest` to get the latest available version in the given region.                                                                        | latest    |
| pod_security_policy                | if true, pods will only be created if they are valid under a PodSecurityPolicy                                         | false          |
| maintenance_start_time             | the start time for maintenance in GMT. Format is 24H e.g. 00:00. The maintenance window is 4 hours from the start time | 00:00          |
| disable_dashboard                  | whether Kubernetes dashboard is to be disabled or not.                                                                 | true           |
| disable_http_load_balancing        | whether http (L7) load balancing is to be disabled or not.                                                             | false          |
| disable_network_policy_config      | whether network policy addon in the cluster is to be disabled or not.                                                  | false          |
| disable_horizontal_pod_autoscaling | whether horizontal pod autoscaling (and heapster metrics) is to be disabled or not.                                    | false          |
| remove_default_node_pool           | whether to delete the default node pool (contains 1 node) or not.                                                      | true           |


## Output variables

| variable                   | description                                                                                |
|----------------------------|--------------------------------------------------------------------------------------------|
| cluster_name               | cluster name.                                                                              |
| cluster_zone               | cluster zone(s).                                                                              |
| cluster_endpoint           | the cluster API server endpoint.                                                           |
| cluster_client_certificate | Base64 encoded public certificate used by clients to authenticate to the cluster endpoint. |
| cluster_client_key         | Base64 encoded private key used by clients to authenticate to the cluster endpoint.        |
| cluster_ca_certificate     | Base64 encoded public certificate that is the root of trust for the cluster.               |