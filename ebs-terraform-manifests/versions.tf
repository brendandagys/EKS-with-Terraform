terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.4.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "~> 2.10.1"
    }
    http = {
      source = "hashicorp/http"
      version = "~> 3.4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-remote-state-eks"
    key = "dev/ebs-storage/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-ebs-storage"
  }
}
