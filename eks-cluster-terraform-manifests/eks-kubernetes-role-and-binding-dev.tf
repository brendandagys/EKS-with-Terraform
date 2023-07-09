resource "kubernetes_role_v1" "eksdeveloper_role" {
  metadata {
    name = "${local.environment}-eksdeveloper-role"
    namespace = kubernetes_namespace_v1.k8s_dev.metadata[0].name 
  }

  rule {
    api_groups     = ["", "extensions", "apps"]
    resources      = ["*"]
    verbs          = ["*"]
  }
  rule {
    api_groups = ["batch"]
    resources  = ["jobs", "cronjobs"]
    verbs      = ["*"]
  }
}

resource "kubernetes_role_binding_v1" "eksdeveloper_rolebinding" {
  metadata {
    name      = "${local.environment}-eksdeveloper-rolebinding"
    namespace = kubernetes_namespace_v1.k8s_dev.metadata[0].name 
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role_v1.eksdeveloper_role.metadata.0.name 
  }
  subject {
    kind      = "Group"
    name      = "eks-developer-group"
    api_group = "rbac.authorization.k8s.io"
  }
}
