data "aws_availability_zones" "available" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr_block
  azs = data.aws_availability_zones.available.names
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = local.common_tags
  vpc_tags = local.common_tags

  single_nat_gateway = var.single_nat_gateway

  map_public_ip_on_launch = true
}
