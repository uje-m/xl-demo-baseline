provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"

  name = var.name
  cidr = var.cidr

  azs             = ["${local.region}a", "${local.region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    Owner       = "user"
    Environment = var.environment
  }

  vpc_tags = {
    Name = var.name
  }
}
