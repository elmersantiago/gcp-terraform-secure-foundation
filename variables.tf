
variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud deployment region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Google Cloud deployment zone"
  type        = string
  default     = "us-central1-a"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "secure-foundation-vpc"
}

variable "subnet_cidr" {
  description = "Primary subnet CIDR range"
  type        = string
  default     = "10.10.0.0/24"
}

variable "machine_type" {
  description = "Compute Engine machine type"
  type        = string
  default     = "e2-micro"
}
  
