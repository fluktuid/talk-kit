module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.14.0"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    instance_types =  ["t3.medium", "t3.small", "t3.micro"]
    instance_type  = "t3.small"
  }
  iam_role_name = ""

  eks_managed_node_groups = {
    worker = {
      name                          = "${var.cluster_name}-g1"
      instance_type                 = "t3.small"
      instance_types                = ["t3.small"] #, "t3.small", "t3.micro"]
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      min_size                      = var.cluster_size.min
      max_size                      = var.cluster_size.max
      desired_size                  = var.cluster_size.desired
      capacity_type                 = var.capacity_type
      labels = {
        Environment = var.cluster_name
        Terraform   = "true"
      }
    }
  }

  tags = {
    Environment = var.cluster_name
    Terraform   = "true"
  }

  aws_auth_users = var.user
}
