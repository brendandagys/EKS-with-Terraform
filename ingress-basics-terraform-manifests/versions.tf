terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.65"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20"
    }    
  }
  backend "s3" {
    bucket = "terraform-remote-state-eks"
    key    = "dev/aws-lbc-ingress/terraform.tfstate"
    region = "us-east-1" 

    dynamodb_table = "dev-aws-lbc-ingress"    
  }    
}
