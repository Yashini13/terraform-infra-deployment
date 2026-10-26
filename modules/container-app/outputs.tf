output "container_app_environment_id" {
  value = azurerm_container_app_environment.env.id
}

output "container_apps_names" {
  value = [
    for app in azurerm_container_app.apps :
    app.name
  ]
}

output "container_apps_fqdn" {
  value = [
    for app in azurerm_container_app.apps :
    app.latest_revision_fqdn
  ]
}