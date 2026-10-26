variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "backend_fqdns" {
  description = "Backend Container App FQDNs"
  type        = list(string)
}

variable "appgw_name" {
  type    = string
  default = "platform-appgw"
}

variable "capacity" {
  type    = number
  default = 1
}