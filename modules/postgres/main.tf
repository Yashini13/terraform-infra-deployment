resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = "platformpostgres123321"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "15"
  delegated_subnet_id    = var.subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.pg_dns.id
  administrator_login    = "pgadmin"
  administrator_password = "pgadmin@123"
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  zone                   = "1"
  public_network_access_enabled = false

  depends_on = [azurerm_private_dns_zone_virtual_network_link.pg_dns_link]
}

resource "azurerm_private_dns_zone" "pg_dns" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pg_dns_link" {
  name                  = "pg-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.pg_dns.name
  virtual_network_id    = var.vnet_id
}