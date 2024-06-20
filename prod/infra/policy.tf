resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "${var.server_name}-secrets-manager-policy"
  description = "Policy to allow access to Secrets Manager"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["secretsmanager:GetSecretValue"],
        Resource = aws_secretsmanager_secret.secret_manager.arn
      }
    ]
  })
}
