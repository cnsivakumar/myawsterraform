variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the instance will be deployed"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name to SSH into the instance"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data script for bootstrapping"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default     = {}
}
