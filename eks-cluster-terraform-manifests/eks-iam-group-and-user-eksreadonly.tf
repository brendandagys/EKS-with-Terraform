resource "aws_iam_group" "eksreadonly_iam_group" {
  name = "${local.environment}-eksreadonly"
  path = "/"
}

resource "aws_iam_group_policy" "eksreadonly_iam_group_assumerole_policy" {
  name  = "${local.environment}-eksreadonly-group-policy"
  group = aws_iam_group.eksreadonly_iam_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Sid      = "AllowAssumeOrganizationAccountRole"
        Resource = "${aws_iam_role.eks_readonly_role.arn}"
      },
    ]
  })
}


resource "aws_iam_user" "eksreadonly_user" {
  name = "${local.environment}-eksreadonly1"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

resource "aws_iam_group_membership" "eksreadonly" {
  name = "${local.environment}-eksreadonly-group-membership"
  users = [
    aws_iam_user.eksreadonly_user.name
  ]
  group = aws_iam_group.eksreadonly_iam_group.name
}
