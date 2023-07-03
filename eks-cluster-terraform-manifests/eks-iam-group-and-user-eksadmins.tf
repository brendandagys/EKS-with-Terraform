resource "aws_iam_group" "eksadmins_iam_group" {
  name = "${local.environment}-eksadmins"
  path = "/"
}

resource "aws_iam_group_policy" "eksadmins_iam_group_assumerole_policy" {
  name  = "${local.environment}-eksadmins-group-policy"
  group = aws_iam_group.eksadmins_iam_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Sid      = "AllowAssumeOrganizationAccountRole"
        Resource = "${aws_iam_role.eks_admin_role.arn}"
      },
    ]
  })
}


# Resource: AWS IAM User - Basic User 
resource "aws_iam_user" "eksadmin_user" {
  name = "${local.environment}-eksadmin3"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

resource "aws_iam_group_membership" "eksadmins" {
  name = "${local.environment}-eksadmins-group-membership"
  users = [
    aws_iam_user.eksadmin_user.name
  ]
  group = aws_iam_group.eksadmins_iam_group.name
}
