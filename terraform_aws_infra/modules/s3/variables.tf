variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Canned ACL to apply to the S3 bucket"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Boolean to forcefully delete bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "logging" {
  description = "Logging configuration for the bucket"
  type = object({
    target_bucket = string
    target_prefix = string
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}
