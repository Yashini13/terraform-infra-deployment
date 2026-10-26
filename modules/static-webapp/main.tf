resource "azurerm_static_web_app" "swa" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.swa_location

  sku_tier = "Free"
  sku_size = "Free"
}