variable "eks_cluster_name" {
  description = "Name of EKS cluster. Also used as a prefix in some related resources."
  default = "eks-project"
}

variable "eks_cluster_service_ipv4_cidr" {
  type = string
  default = null
}

variable "eks_cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (e.g. 1.27)"
  type = string
  default = null
}

variable "eks_cluster_endpoint_public_access" {
  description = "If the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = true
}

variable "eks_cluster_endpoint_private_access" {
  description = "If the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "eks_cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks that can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
