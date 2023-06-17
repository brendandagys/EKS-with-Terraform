locals {
  owner = "Brendan"
  common_tags = {
    owner = local.owner
    environment = var.environment
  }
}
