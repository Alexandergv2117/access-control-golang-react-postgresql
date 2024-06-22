data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = var.key_name

  subnet_id = aws_subnet.public_subnet_1.id

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  root_block_device {
    delete_on_termination = true
  }

  vpc_security_group_ids = [aws_security_group.security_group_ec2.id]

  tags = {
    Name = "${var.server_name}-ec2-instance"
  }
}
