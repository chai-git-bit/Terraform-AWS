resource "aws_security_group" "app1_sg" {
  name        = "${var.env_prefix}-app1-sg"
  description = "Security group for app1"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${var.env_prefix}-app1-sg"
  }
}

output "app1_sg" {
  value = aws_security_group.app1_sg.id
}
