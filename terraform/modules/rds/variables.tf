variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
  type        = list(string)
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_engine" {
  description = "RDS database engine"
  type        = string
}

variable "db_engine_version" {
  description = "RDS database engine version"
  type        = string
}

variable "db_name" {
  description = "RDS database name"
  type        = string
}

variable "db_username" {
  description = "RDS database username"
  type        = string
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  sensitive   = true
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
}

variable "db_publicly_accessible" {
  description = "Make RDS instance publicly accessible"
  type        = bool
}

variable "allowed_db_cidrs" {
  description = "CIDR blocks allowed to access database"
  type        = list(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Owner name"
  type        = string
}
