terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.4.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.21.1"
    }
  }
}
