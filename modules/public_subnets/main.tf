resource "aws_subnet" "app1_public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.env_prefix}-public-subnet"
  }
}

output "app1_public_subnet" {
  value = aws_subnet.app1_public_subnet.id
}
