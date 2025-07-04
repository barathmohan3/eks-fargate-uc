module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "employee-directory-cluster"
  cluster_version = "1.27"
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  node_groups = {
    backend_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = ["t3.medium"]
    }
  }

  fargate_profiles = {
    frontend = {
      selectors = [
        {
          namespace = "frontend"
        }
      ]
    }
  }
}
