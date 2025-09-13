

Cluster role missing recommended managed policies
The cluster role must have the following managed policies or equivalent permissions to use EKS Auto Mode:
AmazonEKSBlockStoragePolicy
AmazonEKSComputePolicy
AmazonEKSLoadBalancingPolicy
AmazonEKSNetworkingPolicy


Cluster role trust policy missing required actions
The cluster role must have the following actions specified in its trust policy to use EKS Auto Mode:
sts:TagSession

# List clusters in a specific region
aws eks list-clusters --region us-west-2

# Get more detailed information about clusters
aws eks describe-cluster --name <cluster-name>

# List clusters with specific output format
aws eks list-clusters --output table
aws eks list-clusters --output text

aws eks update-kubeconfig --name demo-cluster --region ap-south-1
aws eks update-kubeconfig --name Akhilesh-cluster --region ap-south-1

Akhilesh-cluster

# List contexts
kubectl config get-contexts

# Set context
kubectl config use-context <context-name>

# Rename context
kubectl config rename-context <old-name> <new-name>

kubectl config current-context


10.100.210.204 ->               192.168.31.142
10.100.210.204 ->       192.168.31.141
10.100.210.204 ->  192.168.31.143
