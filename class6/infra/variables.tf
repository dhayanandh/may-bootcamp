
variable "region" {
  description = "The region in which the resources will be created"
  default     = "ap-south-1"
}

variable "zone1" {
  description = "The availability zone 1"
  default     = "ap-south-1a"
}

variable "zone2" {
  description = "The availability zone 2"
  default     = "ap-south-1b"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
}

variable "environment" {
  description = "The environment in which the resources will be created"
  default     = "dev"
}
variable "prefix" {
  description = "The prefix for the resources"
  default     = "bootcamp"
}
variable "app_name" {
  description = "The name of the application"
  default     = "student-portal"
}

variable "db_default_settings" {
  type = any
  default = {
    allocated_storage       = 30
    max_allocated_storage   = 50
    engine_version          = 14.15
    instance_class          = "db.t3.micro"
    backup_retention_period = 2
    db_name                 = "postgres"
    ca_cert_name            = "rds-ca-rsa2048-g1"
    db_admin_username       = "postgres"
  }
}