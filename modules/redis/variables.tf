variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "redis_name" {
  type    = string
  default = "platform-redis"
}