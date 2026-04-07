
region                   = "us-east-1"
vpc_cidr_block           = "10.20.0.0/16"
env_prefix               = "dev"
availability_zone        = "us-east-1a"
public_subnet_cidr_block = "10.20.1.0/24"
#private_subnet_cidr_block = "10.20.2.0/24"

ami           = "ami-01b14b7ad41e17ba4"
instance_type = "t3.micro"

public_key_location = " "
