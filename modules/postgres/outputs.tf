output "postgres_server_id" {
  value = azurerm_postgresql_flexible_server.postgres.id
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}

output "postgres_name" {
  value = azurerm_postgresql_flexible_server.postgres.name
}

output "postgres_admin_username" {
  value = azurerm_postgresql_flexible_server.postgres.administrator_login
}