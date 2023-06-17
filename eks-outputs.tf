output "cluster_id" {
  value = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value = aws_eks_cluster.eks_cluster.version
}

output "cluster_iam_role_name" {
  value = aws_iam_role.eks_cluster_role.name 
}

output "cluster_iam_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer"
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster on 1.14 or later. Referred to as 'Cluster security group' in the EKS console."
  value = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

# EKS Node Group Outputs - Public
output "cluster_node_group_public_id" {
  value = aws_eks_node_group.eks_public_node_group.id
}

output "cluster_node_group_public_arn" {
  value = aws_eks_node_group.eks_public_node_group.arn
}

output "cluster_node_group_public_status" {
  value = aws_eks_node_group.eks_public_node_group.status
}

output "cluster_node_group_public_version" {
  description = "Public Node Group Kubernetes Version"
  value = aws_eks_node_group.eks_public_node_group.version
}

# EKS Node Group Outputs - Private
output "cluster_node_group_private_id" {
  value = aws_eks_node_group.eks_private_node_group.id
}

output "cluster_node_group_private_arn" {
  value = aws_eks_node_group.eks_private_node_group.arn
}

output "cluster_node_group_private_status" {
  value = aws_eks_node_group.eks_private_node_group.status 
}

output "cluster_node_group_private_version" {
  description = "Private Node Group Kubernetes Version"
  value = aws_eks_node_group.eks_private_node_group.version
}
