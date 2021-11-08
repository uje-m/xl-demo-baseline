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
| account\_id | The ID of the working account | `any` | n/a | yes |
| account\_type | The Account Type of working account | `any` | n/a | yes |
| alb\_acl | list of CIDR ranges to limit access to public ALB | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| alb\_idle\_timeout | Timeout in seconds for public Application Load Balancer | `number` | `120` | no |
| alb\_internal\_idle\_timeout | Timeout in seconds for internal Application Load Balancer | `number` | `120` | no |
| appstream\_extra\_egress\_cidrs | Additional exgress cidr for appstream | `list(string)` | `[]` | no |
| appstream\_image\_arn | ARN of AppStream | `string` | `"arn:aws:appstream:eu-west-1:092466817582:image/pmi-remote-access-prd-1.1.2"` | no |
| azs\_primary | A list of availability zones in the region | `list` | `[]` | no |
| azs\_secondary | A list of availability zones in the region | `list` | `[]` | no |
| backup\_additional\_plans | Additional backup plans to be defined on request from customer | <pre>map(<br>    object({<br>      tag       = string<br>      schedule  = string<br>      retention = number<br>  }))</pre> | `{}` | no |
| cidr\_primary | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| cidr\_secondary | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `list` | <pre>[<br>  "192.168.0.0/16"<br>]</pre> | no |
| core\_network\_account | Core Networking Account ID | `any` | n/a | yes |
| deep\_portal\_account | DEEP Portal Account ID | `any` | n/a | yes |
| disable\_alb | Possibility to explicitly disable ALB creation. | `bool` | `false` | no |
| eks\_private\_nat\_cidrs | List of CIDR to be redirected through private NAT gateway in EKS subnet. If not empty and EKS subnets are available, it will create NAT Gateways in Private Subnets and add routes to EKS route tables for specified ranges. | `list(string)` | `[]` | no |
| enable\_appstream | Enable Appstream - defaults to false | `bool` | `false` | no |
| enable\_dynamodb\_endpoint | Configure a DynamoDB Endpoint on the VPC | `bool` | `false` | no |
| enable\_internal\_alb | Possibility to enable internal ALB creation. | `bool` | `false` | no |
| enable\_ipv6 | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block | `bool` | `false` | no |
| enable\_nat\_gateway | Should be true if you want to provision NAT Gateways for each of your private networks | `bool` | `false` | no |
| enable\_s3\_endpoint | Configure an S3 Endpoint on the VPC | `bool` | `false` | no |
| environment | The environment of Account | `any` | n/a | yes |
| external\_id | External ID to connect to AWX | `string` | `""` | no |
| flow\_log\_log\_format | The fields to include in the flow log record, in the order in which they should appear. | `string` | `null` | no |
| flow\_log\_traffic\_type | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |
| int\_environment | The int\_environment of Account | `any` | n/a | yes |
| main\_dns\_pvt\_zone\_name | Parent dns zone stored in shared services | `string` | n/a | yes |
| main\_dns\_zone\_name | Parent dns zone stored in shared services | `string` | n/a | yes |
| name | Name of the account | `any` | n/a | yes |
| pmideep\_domain | DEEP domain to use, one of [ pmideep.com, qa-pmideep.com or dev-pmideepcom ] | `string` | `"pmideep.com"` | no |
| pmideep\_zones | List of Route53 zones to be created in pmideep.com domain. Values should be without full domain, i.e. portal for portal.pmideep.com | `list(string)` | `[]` | no |
| policy | Policy for Transit gateway (i.e. greenfield) | `string` | n/a | yes |
| region\_primary | AWS Region to deploy to | `string` | `"eu-west-1"` | no |
| region\_secondary | AWS secondary region to deploy to | `string` | `"eu-central-1"` | no |
| role\_name | AWS role name to assume | `string` | `"TLZOrgAdmin"` | no |
| short\_name | Short name of the account taken from account creation request | `any` | n/a | yes |
| single\_nat\_gateway | Should be true if you want to provision a single shared NAT Gateway across all of your private networks | `bool` | `false` | no |
| tags | A map of tags to add to all resources | `map` | <pre>{<br>  "TGW": "app-test"<br>}</pre> | no |
| tfe\_avm\_workspace\_name | Name of avm workspace | `any` | n/a | yes |
| tfe\_core\_awx\_prd\_workspace\_name | AWX production workspace name | `string` | `"pmi-core-ansibleawx-prd-baseline"` | no |
| tfe\_core\_dsvct\_prd\_workspace\_name | DSVCT production workspace name | `string` | `"pmi-core-dsvct-prd-baseline"` | no |
| tfe\_core\_firewall\_workspace\_name | n/a | `string` | `"pmi-core_firewalls"` | no |
| tfe\_core\_jenkins\_eks\_workspace\_name | Name of deep Jenkins workspace | `string` | `""` | no |
| tfe\_core\_logging\_workspace\_name | Name of logging workspace | `any` | n/a | yes |
| tfe\_core\_network\_resources\_workspace\_name | Name of core network\_resources workspace | `any` | n/a | yes |
| tfe\_core\_network\_workspace\_name | Name of core network workspace | `any` | n/a | yes |
| tfe\_core\_shared\_services\_resources\_workspace\_name | Name of shared services resources workspace | `any` | n/a | yes |
| tfe\_core\_vault\_dev\_workspace\_name | Hashicorp Vault development workspace name | `string` | `"pmi-core_vault-dev"` | no |
| tfe\_core\_vault\_prd\_workspace\_name | Hashicorp Vault production workspace name | `string` | `"pmi-core_vault"` | no |
| tfe\_host\_name | host\_name for ptfe | `any` | n/a | yes |
| tfe\_org\_name | ptfe organization name | `any` | n/a | yes |
| tlz\_id | Organisation TLZ id | `string` | `"deep-tlz"` | no |
| vpc\_name | Name of the account | `any` | n/a | yes |
| vpcmode | Policy for VPC network (i.e. greenfield\_db, greenfield, lands\_db, lands) | `string` | n/a | yes |
| waf\_regional\_exclude\_rules | Possibility to exclude WAF standard rules. | `list(string)` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

To develop on this repo the following binaries are nice to have.

- Terraform 0.12
- pre-commit (https://pre-commit.com/#install)
- terraform-docs (https://github.com/segmentio/terraform-docs)
