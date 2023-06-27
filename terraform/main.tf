
provider "aws" {
  region = var.region
}

module "cluster" {
  for_each = var.cluster
  source   = "./modules/cluster"

  cluster_name             = each.key
  cluster_version          = each.value.version
  autoscaler_k8s_namespace = "autoscaler"
  k8s_service_account_name = "cluster-autoscaler-aws-cluster-autoscaler"

  capacity_type = coalesce(each.value.capacity_type, "SPOT")

  user = each.value.user
}

