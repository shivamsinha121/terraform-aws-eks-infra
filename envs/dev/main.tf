module "vpc" {
  source          = "../../modules/vpc"
  env             = "dev"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  azs             = ["ap-south-1a", "ap-south-1b"]
}

module "eks" {
  source            = "../../modules/eks"
  env               = "dev"
  subnet_ids        = module.vpc.public_subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
}
