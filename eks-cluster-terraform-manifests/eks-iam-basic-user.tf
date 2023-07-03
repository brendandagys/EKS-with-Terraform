# Resource: AWS IAM User - Basic User (No AWSConsole Access for AWS Services)
resource "aws_iam_user" "basic_user" {
  name = "${local.environment}-eksadmin2"  
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

# Resource: AWS IAM User Policy - EKS Full Access
resource "aws_iam_user_policy" "basic_user_eks_policy" {
  name = "${local.environment}-eks-full-access-policy"
  user = aws_iam_user.basic_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListRoles",
          "eks:*",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}
