region          = "ap-south-1"
instance_type   = "t2.micro"
ami_name_prefix = "golden-image-by-akhilesh"
kms_key_id      = "alias/ami-bake"
target_account_ids = ["782567926560", "205366594912"]
vpc_id    = ""  # Leave empty to use default VPC
subnet_id = ""  # Leave empty to use default subnet
ssh_username = "ec2-user"