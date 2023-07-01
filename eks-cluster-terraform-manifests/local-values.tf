locals {
  owner = "Brendan"
  project = "eks-terraform"

  common_tags = {
    owner = local.owner
    environment = var.environment
    project = local.project
  }
}
