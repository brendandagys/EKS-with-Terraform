terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.4.0"
     }
  }

  backend "s3" {
    bucket = "terraform-remote-state-eks"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-ekscluster"
  }
}

provider "aws" {
  region = var.aws_region
}
