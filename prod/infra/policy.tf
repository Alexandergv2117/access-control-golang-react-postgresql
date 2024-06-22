resource "aws_iam_policy" "secrets_manager_policy" {
  name        = "${var.server_name}-secrets-manager-ec2-policy"
  description = "Policy for EC2 instances to access Secrets Manager"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "secretsmanager:GetSecretValue",
        ],
        Resource = [
          "${aws_secretsmanager_secret.secret_manager_db.arn}"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secretsmanager_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.secrets_manager_policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.server_name}-instance-profile"
  role = aws_iam_role.ec2_role.name
}
