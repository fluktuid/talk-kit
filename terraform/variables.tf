variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster" {
  type = map(object({
    user = list(object({
      userarn  = string
      username = string
      groups   = list(string)
    }))
    version       = string
    capacity_type = string
  }))
  default = {}
}

variable "autoscaler_k8s_namespace" {
  type    = string
  default = "autoscaler"
}

variable "k8s_service_account_name" {
  type    = string
  default = "cluster-autoscaler-aws-cluster-autoscaler"
}

variable "k8s_url" {
  type    = string
  default = "cluster.example.com"
}
