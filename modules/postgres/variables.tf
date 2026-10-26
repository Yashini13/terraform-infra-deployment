variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "postgres_admin_username" {
  type    = string
  default = "pgadmin"
}

variable "postgres_admin_password" {
  type      = string
  sensitive = true
  default = "pgadmin@123"
}

variable "postgres_version" {
  type    = string
  default = "15"
}

variable "postgres_sku" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "vnet_id" {
  type = string
}