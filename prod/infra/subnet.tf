resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.server_name}-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.server_name}-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_db_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.server_name}-subnet-db-1"
  }
}

resource "aws_subnet" "private_subnet_db_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.server_name}-subnet-db-2"
  }
}