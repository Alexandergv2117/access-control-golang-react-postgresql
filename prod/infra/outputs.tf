output "public_ip_ec2" {
  value = aws_instance.server.public_ip
}

output "conect_ssh" {
  value = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.server.public_ip}"
}

output "secret_manager_name" {
  value = aws_secretsmanager_secret.secret_manager_db.name
}