variable "location" {
  default = "Central India"
}

variable "resource_group_name" {
  default = "rg-platform-dev"
}

variable "environment" {
  default = "prod"
}
variable "postgres_admin_password" {
  type      = string
  sensitive = true
  default = "pgadmin@123"
}

variable "swa_location" {
  type = string
  default = "centralindia"
}

