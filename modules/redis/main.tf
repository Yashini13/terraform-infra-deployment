resource "azurerm_managed_redis" "redis" {
  name                = var.redis_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = "Balanced_B0"

  default_database {
    clustering_policy = "EnterpriseCluster"
    eviction_policy   = "NoEviction"
  }
}