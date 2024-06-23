resource "random_string" "generate_ramdom_string" {
  length  = 8
  special = false
  upper   = true
  lower   = true
  numeric = false
}

resource "random_string" "generate_ramdom_password" {
  length  = 24
  special = false
  upper   = true
  lower   = true
  numeric = false
}

resource "aws_secretsmanager_secret" "secret_manager_db" {
  name = "${var.server_name}-db-secret-${random_string.generate_ramdom_string.result}"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.secret_manager_db.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_string.generate_ramdom_password.result
    host     = aws_db_instance.db.address
    port     = var.db_port
    dbname   = var.db_name
  })
}
