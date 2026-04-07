# Create a VPC
resource "aws_vpc" "app1_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-app1-vpc"
  }
}

output "app1_vpc" {
  value = aws_vpc.app1_vpc.id

}
