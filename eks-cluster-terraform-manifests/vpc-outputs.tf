output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value = module.vpc.private_subnets
}

output "vpc_public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}

output "vpc_nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value = module.vpc.nat_public_ips
}

output "vpc_availability_zones" {
  description = "A list of availability zones spefified as argument to this module"
  value = module.vpc.azs
}
