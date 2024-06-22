resource "random_string" "example" {
  length  = 8
  special = false
  upper   = true
  lower   = true
  numeric = false
}

resource "aws_secretsmanager_secret" "secret_manager_db" {
  name = "${var.server_name}-db-secret-${random_string.example.result}"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.secret_manager_db.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    host     = aws_db_instance.db.address
    port     = var.db_port
    dbname   = var.db_name
  })
}
