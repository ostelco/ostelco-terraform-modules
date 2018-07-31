# Google GKE cluster Terraform module

Used to create a Kubernetes cluster in Google Kubernetes Engine (GKE).

## Input variables 

| variable                           | description                                                                                                            | default        |
|------------------------------------|------------------------------------------------------------------------------------------------------------------------|----------------|
| cluster_username                   | cluster username.                                                                                                      |                |
| cluster_password                   | password for the cluster username. Must be 16 characters at least.                                                     |                |
| issue_client_certificate           | whether to generate client certificate or not.                                                                         | true           |
| cluster_name                       | cluster name.                                                                                                          |                |
| cluster_zone                       | the zone where the cluster will be created.                                                                            | europe-west1-c |
| cluster_region                     | the region where the cluster will be created.                                                                          | europe-west1   |
| cluster_additional_zones           | additional zones to create the cluster in. This makes the cluster multizoned (regional) and improves availability.     | []             |
| cluster_network                    | the network where the cluster will be created.                                                                         | default        |
| cluster_subnetwork                 | the subnetwork where the cluster will be created.                                                                      | default        |
| cluster_description                | description of the cluster and its purpose.                                                                            |                |
| cluster_version                    | the k8s version of the cluster master and nodes.                                                                       | 1.9.7-gke.3    |
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
| cluster_zone               | cluster zone.                                                                              |
| cluster_endpoint           | the cluster API server endpoint.                                                           |
| cluster_client_certificate | Base64 encoded public certificate used by clients to authenticate to the cluster endpoint. |
| cluster_client_key         | Base64 encoded private key used by clients to authenticate to the cluster endpoint.        |
| cluster_ca_certificate     | Base64 encoded public certificate that is the root of trust for the cluster.               |