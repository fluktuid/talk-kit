variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS region"
}

variable "cluster_name" {
  type    = string
  default = "clt-eks-autoscaling"
}

variable "autoscaler_k8s_namespace" {
  type    = string
  default = "autoscaler"
}

variable "k8s_service_account_name" {
  type    = string
  default = "cluster-autoscaler"
}

variable "user" {
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "cluster_version" {
  type = string
  default = "1.26"
}

variable cluster_size {
  type = object({
    min     = number
    max     = number
    desired = number
  })
  default = {
    min = 1
    max = 10
    desired = 2
  }
}

variable capacity_type {
  description = "vm capacity type"
  type = string
  default = "SPOT"
  validation {
    condition     = var.capacity_type == "SPOT" || var.capacity_type == "ON_DEMAND"
    error_message = "Must be 'SPOT' or 'ON_DEMAND'"
  }
}
