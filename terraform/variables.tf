variable "project_name" {
  description = "Project prefix for naming resources"
  type        = string
  default     = "revora"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "southeastasia"
}

variable "node_count" {
  description = "Number of worker nodes for High Availability"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s"
}