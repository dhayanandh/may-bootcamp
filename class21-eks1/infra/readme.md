Terraform init

terraform plan

Terraform apply -> this will deploy the cluster

first aply will get stuck on managed node group creation 
-> add the addon VPC-cni manually 
-> the apply will complete


# configure cluste access

aws eks update-kubeconfig --region ap-south-1  --name may25-dev-cluster

# deploy bresources on fargate

kubectk commands --- 
