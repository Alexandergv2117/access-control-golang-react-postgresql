// EC2 instance security group

resource "aws_security_group" "security_group" {
  name   = "security-group-ec2"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.server_name}-security-group-ec2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22

  tags = {
    Name = "${var.server_name}-allow-ssh-ingress-rule"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name = "${var.server_name}-allow-http-ingress-rule"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

  tags = {
    Name = "${var.server_name}-allow-https-ingress-rule"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "${var.server_name}-allow-all-egress-rule"
  }
}

// Database instance security group

resource "aws_security_group" "security_group_db" {
  name   = "security-group-db"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.server_name}-security-group-db"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_postgres" {
  security_group_id = aws_security_group.security_group_db.id
  cidr_ipv4         = "0.0.0.0/0"

  from_port   = var.db_port
  ip_protocol = "tcp"
  to_port     = var.db_port

  tags = {
    Name = "${var.server_name}-allow-postgres-ingress-rule"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_db" {
  security_group_id = aws_security_group.security_group_db.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "${var.server_name}-allow-all-egress-rule"
  }
}
