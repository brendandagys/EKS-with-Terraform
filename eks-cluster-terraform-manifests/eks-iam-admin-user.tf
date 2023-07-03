resource "aws_iam_user" "admin_user" {
  name = "${local.environment}-eksadmin1"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

resource "aws_iam_user_policy_attachment" "admin_user" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
