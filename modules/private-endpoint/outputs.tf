output "private_endpoint_id" {
  value = azurerm_private_endpoint.pe.id
}

output "private_endpoint_name" {
  value = azurerm_private_endpoint.pe.name
}

output "network_interface_ids" {
  value = azurerm_private_endpoint.pe.network_interface
}