<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Application Resources](#application-resources)
  - [Requirements](#requirements)
  - [Providers](#providers)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
  - [Requirements](#requirements-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Application Resources


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr | n/a | `any` | n/a | yes |
| environment | The environment of Account | `any` | n/a | yes |
| name | Name of the account | `any` | n/a | yes |
| private\_subnets | n/a | `any` | n/a | yes |
| public\_subnets | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| azs | A list of availability zones specified as argument to this module |
| nat\_public\_ips | List of public Elastic IPs created for AWS NAT Gateway |
| private\_subnets | List of IDs of private subnets |
| public\_subnets | List of IDs of public subnets |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

To develop on this repo the following binaries are nice to have.

- Terraform 0.12
- pre-commit (https://pre-commit.com/#install)
- terraform-docs (https://github.com/segmentio/terraform-docs)
