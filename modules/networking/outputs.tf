output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "container_subnet_id" {
  value = azurerm_subnet.container_subnet.id
}

output "db_subnet_id" {
  value = azurerm_subnet.db_subnet.id
}

output "private_endpoint_subnet_id" {
  value = azurerm_subnet.private_endpoint_subnet.id
}

output "appgw_subnet_id" {
  value = azurerm_subnet.appgw_subnet.id
}
