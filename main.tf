provider "aws" {
  region = local.region
}

locals {
  region                  = "us-east-1"
  s3_flow_log_bucket_name = "${var.environment}-${var.name}-vpc-flow-log"
  common_tags = {
    project       = var.name
    stack_env     = var.environment
    stack         = var.name
    stack_version = "0.1.0"
    Environment   = upper(var.environment)
  }
}

data "aws_caller_identity" "current" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"

  name = var.name
  cidr = var.cidr

  azs                = ["${local.region}a", "${local.region}b"]
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_ipv6        = true
  enable_nat_gateway = true
  single_nat_gateway = true
  public_subnet_tags = {
    Name                                = "subnet-${var.name}-public"
    "kubernetes.io/role/elb"            = 1
    "kubernetes.io/cluster/${var.name}" = "shared"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"   = "1"
    "kubernetes.io/cluster/${var.name}" = "shared"
  }
  enable_flow_log           = var.environment == "dev" ? false : true
  flow_log_destination_type = "s3"
  flow_log_destination_arn  = module.s3_flow_log_bucket.this_s3_bucket_arn
  enable_dns_hostnames      = true
  enable_dns_support        = true
  vpc_flow_log_tags = {
    Name = "vpc-flow-logs-s3-bucket"
  }
  tags = local.common_tags
  vpc_tags = {
    Name = var.name
  }
}

module "s3_flow_log_bucket" {
  source        = "terraform-aws-modules/s3-bucket/aws"
  version       = "~> 1.0"
  bucket_prefix = local.s3_flow_log_bucket_name
  policy        = data.aws_iam_policy_document.flow_log_s3.json
  force_destroy = true

  tags = {
    Name = "vpc-flow-logs-s3-bucket"
  }
}

data "aws_iam_policy_document" "flow_log_s3" {
  statement {
    sid = "AWSLogDeliveryWrite"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = ["arn:aws:s3:::${local.s3_flow_log_bucket_name}/AWSLogs/*"]
  }

  statement {
    sid = "AWSLogDeliveryAclCheck"

    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    effect = "Allow"

    actions = [
      "s3:GetBucketAcl",
    ]

    resources = ["arn:aws:s3:::${local.s3_flow_log_bucket_name}"]
  }
}
