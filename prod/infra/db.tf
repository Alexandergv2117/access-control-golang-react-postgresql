resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.server_name}-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_db_1.id,
    aws_subnet.private_subnet_db_2.id
  ]

  tags = {
    Name = "${var.server_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  allocated_storage    = var.db_storage_size
  storage_type         = var.db_storage_type
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_type
  db_name              = var.db_name
  username             = var.db_username
  password             = random_string.generate_ramdom_password.result
  port                 = var.db_port
  skip_final_snapshot  = var.db_skip_final_snapshot
  publicly_accessible  = var.db_publicly_accessible

  vpc_security_group_ids = [
    aws_security_group.security_group_db.id
  ]

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "${var.server_name}-db-instance"
  }
}
