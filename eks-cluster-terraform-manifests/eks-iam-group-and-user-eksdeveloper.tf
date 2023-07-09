resource "aws_iam_group" "eksdeveloper_iam_group" {
  name = "${local.environment}-eksdeveloper"
  path = "/"
}

resource "aws_iam_group_policy" "eksdeveloper_iam_group_assumerole_policy" {
  name  = "${local.environment}-eksdeveloper-group-policy"
  group = aws_iam_group.eksdeveloper_iam_group.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
        Sid    = "AllowAssumeOrganizationAccountRole"
        Resource = "${aws_iam_role.eks_developer_role.arn}"
      },
    ]
  })
}


resource "aws_iam_user" "eksdeveloper_user" {
  name = "${local.environment}-eksdeveloper1"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}


resource "aws_iam_group_membership" "eksdeveloper" {
  name = "${local.environment}-eksdeveloper-group-membership"
  users = [
    aws_iam_user.eksdeveloper_user.name
  ]
  group = aws_iam_group.eksdeveloper_iam_group.name
}



