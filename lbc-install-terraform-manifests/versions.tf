# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.65"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.9"
    }
    http = {
      source = "hashicorp/http"
      version = "~> 3.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.20"
    }      
  }

  backend "s3" {
    bucket = "terraform-remote-state-eks"
    key    = "dev/aws-lbc/terraform.tfstate"
    region = "us-east-1" 

    dynamodb_table = "dev-aws-lbc"    
  }     
}

provider "aws" {
  region = var.aws_region
}

provider "http" {}
