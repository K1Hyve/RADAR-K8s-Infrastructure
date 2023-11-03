variable "AWS_REGION" {
  type        = string
  description = "Target AWS region"
  default     = "eu-west-2"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS access key associated with an IAM account"
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret key associated with the access key"
  sensitive   = true
}

variable "AWS_SESSION_TOKEN" {
  type        = string
  description = "Session token for temporary security credentials from AWS STS"
  default     = ""
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags associated to resources created"
  default = {
    Project     = "radar-base-development"
    Environment = "dev"
  }
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "instance_capacity_type" {
  type        = string
  description = "Capacity type used by EKS managed node groups"
  default     = "SPOT"

  validation {
    condition     = var.instance_capacity_type == "ON_DEMAND" || var.instance_capacity_type == "SPOT"
    error_message = "Invalid instance capacity type. Allowed values are 'ON_DEMAND' or 'SPOT'."
  }
}

variable "management_portal_postgres_password" {
  type        = string
  description = "Password for the PostgreSQL database used by Management Portal"
  default     = "change_me"
  sensitive   = true
}

variable "radar_appserver_postgres_password" {
  type        = string
  description = "Password for the PostgreSQL database used by Radar Appserver"
  default     = "change_me"
  sensitive   = true
}

variable "radar_rest_sources_backend_postgres_password" {
  type        = string
  description = "Password for the PostgreSQL database used by Radar Rest Sources Authorizer backend"
  default     = "change_me"
  sensitive   = true
}
