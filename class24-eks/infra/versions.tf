terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
backend "s3" {
    bucket         = "state-bucket-879381241087"
    key            = "may-bootcamp/class24/terraform/state"
    region         = "ap-south-1"
    encrypt        = true
}
}


