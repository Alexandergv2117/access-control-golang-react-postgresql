output "public_ip_ec2" {
  value = aws_instance.server.public_ip
}

output "db" {
  value = aws_db_instance.db.address
}

output "db_ip" {
  value = aws_db_instance.db.endpoint
}

output "conect_ssh" {
  value = "ssh -i ~/.ssh/${var.key_name}.pem ubuntu@${aws_instance.server.public_ip}"
}