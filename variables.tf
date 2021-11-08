# AWS Provider Variables
variable "region_primary" {
  description = "AWS Region to deploy to"
  default     = "eu-west-1"
}

variable "region_secondary" {
  description = "AWS secondary region to deploy to"
  default     = "eu-central-1"
}

variable "role_name" {
  description = "AWS role name to assume"
  default     = "TLZOrgAdmin"
}

variable "tlz_id" {
  description = "Organisation TLZ id"
  type        = string
  default     = "deep-tlz"
}

# Account Variables
variable "account_id" {
  description = "The ID of the working account"
}

variable "account_type" {
  description = "The Account Type of working account"
}

variable "environment" {
  description = "The environment of Account"
}

variable "int_environment" {
  description = "The int_environment of Account"
}

variable "name" {
  description = "Name of the account"
}

variable "short_name" {
  description = "Short name of the account taken from account creation request"
}

# VPC Variables
variable "vpc_name" {
  description = "Name of the account"
}

variable "cidr_primary" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "0.0.0.0/0"
}

variable "azs_primary" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "cidr_secondary" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = ["192.168.0.0/16"]
}

variable "azs_secondary" {
  description = "A list of availability zones in the region"
  default     = []
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = false
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default = {
    "TGW" = "app-test"
  }
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block"
  default     = false
}

variable "enable_s3_endpoint" {
  description = "Configure an S3 Endpoint on the VPC"
  default     = false
}

variable "enable_dynamodb_endpoint" {
  description = "Configure a DynamoDB Endpoint on the VPC"
  default     = false
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
  type        = string
  default     = "ALL"
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "tfe_host_name" {
  description = "host_name for ptfe"
}

variable "tfe_org_name" {
  description = "ptfe organization name"
}

variable "tfe_avm_workspace_name" {
  description = "Name of avm workspace"
}

variable "tfe_core_logging_workspace_name" {
  description = "Name of logging workspace"
}

variable "deep_portal_account" {
  description = "DEEP Portal Account ID"
}

variable "core_network_account" {
  description = "Core Networking Account ID"
}

variable "tfe_core_network_workspace_name" {
  description = "Name of core network workspace"
}

variable "tfe_core_network_resources_workspace_name" {
  description = "Name of core network_resources workspace"
}

variable "tfe_core_firewall_workspace_name" {
  default = "pmi-core_firewalls"
}

variable "tfe_core_shared_services_resources_workspace_name" {
  description = "Name of shared services resources workspace"
}

variable "tfe_core_jenkins_eks_workspace_name" {
  description = "Name of deep Jenkins workspace"
  default     = ""
}

variable "policy" {
  type        = string
  description = "Policy for Transit gateway (i.e. greenfield)"
}

variable "main_dns_zone_name" {
  type        = string
  description = "Parent dns zone stored in shared services"
}

variable "main_dns_pvt_zone_name" {
  type        = string
  description = "Parent dns zone stored in shared services"
}

variable "alb_acl" {
  description = "list of CIDR ranges to limit access to public ALB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpcmode" {
  type        = string
  description = "Policy for VPC network (i.e. greenfield_db, greenfield, lands_db, lands)"
}

variable "backup_additional_plans" {
  default = {}
  type = map(
    object({
      tag       = string
      schedule  = string
      retention = number
  }))
  description = "Additional backup plans to be defined on request from customer"
}

variable "pmideep_domain" {
  type        = string
  default     = "pmideep.com"
  description = "DEEP domain to use, one of [ pmideep.com, qa-pmideep.com or dev-pmideepcom ]"
}

variable "pmideep_zones" {
  type        = list(string)
  default     = []
  description = "List of Route53 zones to be created in pmideep.com domain. Values should be without full domain, i.e. portal for portal.pmideep.com"
}

variable "eks_private_nat_cidrs" {
  description = "List of CIDR to be redirected through private NAT gateway in EKS subnet. If not empty and EKS subnets are available, it will create NAT Gateways in Private Subnets and add routes to EKS route tables for specified ranges."
  type        = list(string)
  default     = []
}

variable "alb_idle_timeout" {
  description = "Timeout in seconds for public Application Load Balancer"
  type        = number
  default     = 120
}

variable "alb_internal_idle_timeout" {
  description = "Timeout in seconds for internal Application Load Balancer"
  type        = number
  default     = 120
}

variable "disable_alb" {
  description = "Possibility to explicitly disable ALB creation."
  type        = bool
  default     = false
}

variable "enable_internal_alb" {
  description = "Possibility to enable internal ALB creation."
  type        = bool
  default     = false
}

variable "waf_regional_exclude_rules" {
  description = "Possibility to exclude WAF standard rules."
  type        = list(string)
  default     = []
}

variable "enable_appstream" {
  description = "Enable Appstream - defaults to false"
  type        = bool
  default     = false
}

variable "appstream_image_arn" {
  description = "ARN of AppStream"
  default     = "arn:aws:appstream:eu-west-1:092466817582:image/pmi-remote-access-prd-1.1.2"
}

variable "appstream_extra_egress_cidrs" {
  description = "Additional exgress cidr for appstream"
  type        = list(string)
  default     = []
}

variable "tfe_core_vault_prd_workspace_name" {
  description = "Hashicorp Vault production workspace name"
  type        = string
  default     = "pmi-core_vault"
}

variable "tfe_core_vault_dev_workspace_name" {
  description = "Hashicorp Vault development workspace name"
  type        = string
  default     = "pmi-core_vault-dev"
}

variable "external_id" {
  description = "External ID to connect to AWX"
  type        = string
  default     = ""
}

variable "tfe_core_awx_prd_workspace_name" {
  description = "AWX production workspace name"
  type        = string
  default     = "pmi-core-ansibleawx-prd-baseline"
}

variable "tfe_core_dsvct_prd_workspace_name" {
  description = "DSVCT production workspace name"
  type        = string
  default     = "pmi-core-dsvct-prd-baseline"
}
