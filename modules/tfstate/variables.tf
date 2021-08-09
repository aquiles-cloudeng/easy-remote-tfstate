variable "project_name" {
  description = "The Name of the Project"
  type        = string
}

variable "environment" {
  description = "The Name of the Environment. If not empty will be appended to the bucket and DynamoDB names"
  default     = ""
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resources"
  type        = map(string)
}

variable "region" {
  description = "If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee"
  default     = ""
}

variable "append_region_to_name" {
  description = "Whether to add the region to the bucket and DynamoDB names"
  default     = false
  type        = bool
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply to the S3 bucket"
  default     = "private"
}

variable "read_capacity" {
  default     = 2
  description = "DynamoDB read capacity units"
}

variable "write_capacity" {
  default     = 2
  description = "DynamoDB write capacity units"
}

variable "force_destroy" {
  description = "A boolean that indicates the S3 bucket can be destroyed even if it contains objects. These objects are not recoverable"
  default     = false
  type        = bool
}

variable "mfa_delete" {
  description = "A boolean that indicates that versions of S3 objects can only be deleted with MFA. ( Terraform cannot apply changes of this value; https://github.com/terraform-providers/terraform-provider-aws/issues/629 )"
  default     = false
  type        = bool
}
