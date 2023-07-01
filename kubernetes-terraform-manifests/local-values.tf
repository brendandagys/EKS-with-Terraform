locals {
  owner = "Brendan"
  environment = var.environment
  
  common_tags = {
    owner = local.owner
    environment = var.environment
  }

  eks_cluster_name = "${data.terraform_remote_state.eks.outputs.cluster_id}"  
}
