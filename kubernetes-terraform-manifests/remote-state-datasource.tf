data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-remote-state-eks"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
