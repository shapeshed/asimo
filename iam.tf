data "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://token.actions.githubusercontent.com"
}

data "aws_iam_policy_document" "aerial_registry_github_actions_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.github_actions.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:shapeshed/aerial-registry:*"]
    }
  }
}

resource "aws_iam_role" "aerial_registry_github_actions" {
  name               = "aerial-registry-github-actions"
  assume_role_policy = data.aws_iam_policy_document.aerial_registry_github_actions_assume.json
}

resource "aws_iam_role_policy" "aerial_registry_github_actions" {
  name = "aerial-registry-deploy"
  role = aws_iam_role.aerial_registry_github_actions.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.aerial-shapeshed-com.arn}/*"
      },
      {
        Effect   = "Allow"
        Action   = "cloudfront:CreateInvalidation"
        Resource = aws_cloudfront_distribution.aerial_shapeshed_com.arn
      }
    ]
  })
}

output "aerial_registry_role_arn" {
  value = aws_iam_role.aerial_registry_github_actions.arn
}
