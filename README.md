# KIT Lecture

This git contains the materials for the KIT lecture on 30 June 22 (lecture AI-IC).

## Contents

- kubernetes\
  kubernetes files
- scripts\
  Scripts for configuring
- terraform \
  Scripts for setting up the cluster
- other folders\
  golang-code for components

## How to use?

1. (optional) Build the images\
   Run `make build

1. setting up the cluster
   Run `terraform plan; terradform apply` or `make cluster-create` 1.

1. logging into the cluster
   Load the Kubeconfig in the Teraform folder or `make cluster-login`. 1.

1. setting up common services in the cluster\
   Execute the scripts in the `scripts` folder or `make cluster-prepare`.
   The ingress for Grafana/Prometheus may have to be adapted here.
   If the cluster scaler is to be used, the name of the worker group must also be adapted and the fingerprint of the IDP adapted (if it has expired).
   The worker group can be found in the EC2 GUI under the corresponding menu item. 1.

Set the DNS entry on the load balancer of the Nginx-ingress in the cluster. 1.

1. install the app
   Apply the Kubernetes manifest in the folder `kubernetes` or `make app`.
   Here you may need to adjust the ingress for Grafana/Prometheus.

1. 🎉


## Requirements

1. an aws account\
   a set up `aws` cli-tool will help
1. `terraform`, `kubectl` and `helm` installed
