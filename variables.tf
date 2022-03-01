variable "environment" {
  description = "Environment information e.g. account IDs, public/private subnet cidrs"
  type = object({
    resource_name_prefix        = string
    default_tags                  = map(string)
  })
  default = {
    resource_name_prefix          = ""
    default_tags                  = {}
  }
}
variable "vpc" {
  description = "VPC information. These are inputs to the VPC module github.com/terraform-aws-modules/terraform-aws-vpc.git"
  type = object({
    vpc_id                      = string
    # VPC cidr block. Must not overlap with other VPCs in this aws account or others within our organisation.
    cidr_block                  = string
    # List of VPC private subnet cidr blocks. Must not overlap with other VPCs in this aws account or others within our organisation.
    private_subnets_cidr_blocks = list(string)
    private_subnets_ids         = list(string)
    # List of VPC public subnet cidr blocks. Must not overlap with other VPCs in this aws account or others within our organisation.
    public_subnets_cidr_blocks  = list(string)
    public_subnets_ids          = list(string)
  })
  default = {
    vpc_id                        = ""
    cidr_block                    = "",
    private_subnets_cidr_blocks   = [],
    private_subnets_ids           = []
    public_subnets_cidr_blocks    = []
    public_subnets_ids            = []
  }
}
variable "name" {
  type        = string
  default     = "ad-from-linux"
}
variable "ad_ip_cidrs" {
  type        = list(string)
  description = "The host ip addresses of the local Active Directory Controllers (in cidr format)"
  default     = []
}
variable "global_default_tags" {
  type        = map(string)
  description = "Global default tags"
  default     = {}
}
