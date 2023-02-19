
resource "azurerm_app_service_plan" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  sku_name            = var.sku
  app_service_environmnet_id = var.app_service_environmnet_id
  

}