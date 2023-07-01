locals {
  owner = "Brendan"
  project = "eks-terraform"
  common_tags = {
    environment = var.environment
    owner = local.owner
    project = local.project
  }
}
