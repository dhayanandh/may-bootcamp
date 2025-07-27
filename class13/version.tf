terraform {
  required_version = "1.8.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    #   version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}
terraform{
backend "s3" {
    bucket         = "state-bucket-879381241087"
    key            = "may-bootcamp/class13/terraform/state"
    region         = "ap-south-1"
    encrypt        = true
}
}