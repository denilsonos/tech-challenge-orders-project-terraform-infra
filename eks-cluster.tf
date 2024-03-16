module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  # TODO add github info
  tags = {
    Environment = "Development"
    GithubRepo  = "YourRepoNameHere"
    GithubOrg   = "YourOrganizationGitNameHere"
  }

  # TODO add app configuration pods
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      # https://aws.amazon.com/pt/ec2/instance-types/t3/
      instance_types = ["t4g.small"]
      ami_type       = "AL2_ARM_64"

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
