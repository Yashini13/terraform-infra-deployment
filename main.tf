resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Networking

module "networking" {
  source = "./modules/networking"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

# PostgreSQL

module "postgres" {
  source = "./modules/postgres"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  subnet_id = module.networking.db_subnet_id

  postgres_admin_password = var.postgres_admin_password

  vnet_id = module.networking.vnet_id

  depends_on = [
    module.networking
  ]
}

# Redis

module "redis" {
  source = "./modules/redis"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

# Container Apps

module "container_apps" {
  source = "./modules/container-app"

  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  infrastructure_subnet_id = module.networking.container_subnet_id

  container_app_count = 1

  depends_on = [
    module.networking
  ]
}

# Application Gateway

# module "app_gateway" {
#   source = "./modules/application-gateway"

#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.location

#   subnet_id = module.networking.appgw_subnet_id

#   backend_fqdns = module.container_apps.container_apps_fqdn
# }

# Static Web Apps


module "swa1" {
  source = "./modules/static-webapp"

  name                = "swa-frontend-1"
  resource_group_name = azurerm_resource_group.rg.name
#   location            = var.swa_location
}

# module "swa2" {
#   source = "./modules/static-webapp"

#   name                = "swa-frontend-2"
#   resource_group_name = azurerm_resource_group.rg.name
# #   location            = var.swa_location
# }

# module "swa3" {
#   source = "./modules/static-webapp"

#   name                = "swa-frontend-3"
#   resource_group_name = azurerm_resource_group.rg.name
# #   location            = var.swa_location
# }

# module "swa4" {
#   source = "./modules/static-webapp"

#   name                = "swa-frontend-4"
#   resource_group_name = azurerm_resource_group.rg.name
# #   location            = var.swa_location
# }