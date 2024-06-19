resource "aws_secretsmanager_secret" "secret_manager" {
  name = "${var.server_name}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.secret_manager.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    host     = aws_db_instance.db.address
    port     = var.db_port
    dbname   = var.db_name
  })
}
