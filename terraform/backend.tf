# Terraform Backend Configuration
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # Local backend for this project
  # In production, consider using S3 backend with DynamoDB locking
  backend "local" {
    path = "terraform.tfstate"
  }
}

# AWS Provider Configuration
provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "PROG8870-Final"
      Owner       = var.owner
      ManagedBy   = "Terraform"
    }
  }
}
