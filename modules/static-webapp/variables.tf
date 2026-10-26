variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "swa_location" {
  description = "Azure region for Static Web Apps"
  type        = string
  default     = "East US 2"
}