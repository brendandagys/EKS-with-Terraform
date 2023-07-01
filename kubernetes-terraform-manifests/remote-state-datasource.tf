data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../eks-cluster-terraform-manifests/terraform.tfstate"
  }
}
