locals {
  owner = "Brendan"
  environment = var.environment
  project = "eks-terraform"

  common_tags = {
    owner = local.owner
    environment = var.environment
    project = local.project
  }
}
