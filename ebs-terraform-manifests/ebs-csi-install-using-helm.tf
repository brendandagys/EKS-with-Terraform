# Install EBS CSI Driver using HELM
resource "helm_release" "ebs_csi_driver" {
  depends_on = [aws_iam_role.ebs_csi_iam_role]
  name       = "${local.environment}-aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"     

  set {
    name = "image.repository"
    # us-east-1 (changes based on Region). Additional Reference: https://docs.aws.amazon.com/eks/latest/userguide/add-ons-images.html
    value = "602401143452.dkr.ecr.us-east-1.amazonaws.com/eks/aws-ebs-csi-driver"
  }       

  set {
    name  = "controller.serviceAccount.create"
    value = "true"
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = "${aws_iam_role.ebs_csi_iam_role.arn}"
  }
}
