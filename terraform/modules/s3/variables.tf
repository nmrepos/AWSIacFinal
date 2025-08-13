variable "bucket_names" {
  description = "List of S3 bucket names"
  type        = list(string)
}

variable "enable_versioning" {
  description = "Enable versioning on S3 buckets"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Owner name"
  type        = string
}
