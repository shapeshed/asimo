output "aerial_registry_role_arn" {
  description = "IAM role ARN for the aerial-registry GitHub Actions OIDC workflow"
  value       = aws_iam_role.aerial_registry_github_actions.arn
}
