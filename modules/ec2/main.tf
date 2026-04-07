resource "aws_instance" "app1_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.vpc_security_groups_ids]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.app1_ec2_key.key_name

  tags = {
    Name = "${var.env_prefix}-app1-ec2"
  }

}

resource "aws_key_pair" "app1_ec2_key" {
  key_name   = "app1_ec2_key"
  public_key = var.public_key_location

}
