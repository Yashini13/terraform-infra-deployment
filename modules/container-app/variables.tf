variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "infrastructure_subnet_id" {
  type = string
}

variable "container_app_count" {
  type    = number
  default = 4
}