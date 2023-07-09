# Get AWS Account ID
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

locals {
  # Sample Role Format: arn:aws:iam::180789647333:role/hr-dev-eks-nodegroup-role
  configmap_roles = [
    {
      #rolearn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.eks_nodegroup_role.name}"
      rolearn = "${aws_iam_role.eks_nodegroup_role.arn}"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups = ["system:bootstrappers", "system:nodes"]
    },
    {
      rolearn = "${aws_iam_role.eks_admin_role.arn}"
      username = "eks-admin" # Placeholder name
      groups = ["system:masters"]
    },
    {
      rolearn = "${aws_iam_role.eks_readonly_role.arn}"
      username = "eks-readonly"
      groups = ["${kubernetes_cluster_role_binding_v1.eksreadonly_clusterrolebinding.subject.0.name}"]
    },
    {
      rolearn  = "${aws_iam_role.eks_developer_role.arn}"
      username = "eks-developer"
      groups   = [ "${kubernetes_role_binding_v1.eksdeveloper_rolebinding.subject[0].name}" ]
    },  
  ]
  configmap_users = [
    {
      userarn = "${aws_iam_user.admin_user.arn}"
      username = "${aws_iam_user.admin_user.name}"
      groups = ["system:masters"]
    },
    {
      userarn = "${aws_iam_user.basic_user.arn}"
      username = "${aws_iam_user.basic_user.name}"
      groups = ["system:masters"]
    },
  ]
}

resource "kubernetes_config_map_v1" "aws_auth" {
  depends_on = [
    aws_eks_cluster.eks_cluster,
    kubernetes_cluster_role_binding_v1.eksreadonly_clusterrolebinding,
    kubernetes_cluster_role_binding_v1.eksdeveloper_clusterrolebinding,
    kubernetes_role_binding_v1.eksdeveloper_rolebinding,
  ]
  metadata {
    name = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode(local.configmap_roles)
    mapUsers = yamlencode(local.configmap_users)
  }

}
