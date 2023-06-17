data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "${local.project}-vpc"
  cidr = var.vpc_cidr_block
  azs = data.aws_availability_zones.available.names
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets = var.vpc_database_subnets

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = local.common_tags
  vpc_tags = local.common_tags

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # Instances launched into the Public subnet should be assigned a public IP address.
  map_public_ip_on_launch = true

  # Additional subnet tags
  public_subnet_tags = {
    Type = "public-subnets"
    "kubernetes.io/role/elb" = 1    
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"        
  }

  private_subnet_tags = {
    Type = "private-subnets"
    "kubernetes.io/role/internal-elb" = 1    
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"    
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }
}
