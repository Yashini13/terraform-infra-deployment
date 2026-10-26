output "application_gateway_id" {
  value = azurerm_application_gateway.appgw.id
}

output "application_gateway_name" {
  value = azurerm_application_gateway.appgw.name
}

output "public_ip" {
  value = azurerm_public_ip.pip.ip_address
}

output "frontend_ip_configuration" {
  value = azurerm_application_gateway.appgw.frontend_ip_configuration
}