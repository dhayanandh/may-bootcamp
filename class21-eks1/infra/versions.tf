terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.12"
    }
  }
backend "s3" {
    bucket         = "state-bucket-879381241087"
    key            = "may-bootcamp/class21/terraform/state"
    region         = "ap-south-1"
    encrypt        = true
}
}


