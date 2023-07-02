terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.4.0"
     }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.21.1"
    }     
  }

  backend "s3" {
    bucket = "terraform-remote-state-eks"
    key    = "dev/ebs-sampleapp-demo/terraform.tfstate"
    region = "us-east-1" 

    dynamodb_table = "dev-ebs-sampleapp-demo"    
  }    
}

