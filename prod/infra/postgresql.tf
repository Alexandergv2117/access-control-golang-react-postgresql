resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.server_name}-db-subnet-group"
  subnet_ids = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_db.id
  ]

  tags = {
    Name = "${var.server_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "16.2"
  instance_class       = var.db_instance_type
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  port                 = var.db_port
  skip_final_snapshot  = true
  publicly_accessible  = true

  vpc_security_group_ids = [
    aws_security_group.security_group_db.id
  ]

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = var.db_name
  }
}
