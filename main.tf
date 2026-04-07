terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Call the VPC module
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  env_prefix     = var.env_prefix
}

module "public_subnets" {
  source                   = "./modules/public_subnets"
  vpc_id                   = module.vpc.app1_vpc
  public_subnet_cidr_block = var.public_subnet_cidr_block
  availability_zone        = var.availability_zone
  env_prefix               = var.env_prefix
}

module "security_groups" {
  source     = "./modules/security_groups"
  vpc_id     = module.vpc.app1_vpc
  env_prefix = var.env_prefix

}

module "ec2" {
  source                  = "./modules/ec2"
  env_prefix              = var.env_prefix
  ami                     = var.ami
  instance_type           = var.instance_type
  public_key_location     = var.public_key_location
  subnet_id               = module.public_subnets.app1_public_subnet
  vpc_security_groups_ids = module.security_groups.app1_sg
}
