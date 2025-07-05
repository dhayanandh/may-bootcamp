region          = "ap-south-1"
instance_type   = "t2.medium"
ami_name_prefix = "al2023-advanced-prod"
kms_key_id      = "alias/ami-bake"
target_account_ids = ["782567926560", "205366594912"]
vpc_id    = "vpc-abcdef1234567890"  # Specify a production VPC
subnet_id = "subnet-abcdef1234567890"  # Specify a private subnet
ssh_username = "ec2-user"