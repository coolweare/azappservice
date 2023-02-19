resource "azurerm_application_insights" "function_app_linux" {
  name                = "redacted"
  location            = var.location
  resource_group_name = var.resource_group
  application_type    = var.application_type
  tags                = var.tags
}

locals {
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "true"
    WEBSITE_ENABLE_SYNC_UPDATE_SITE     = "true"
    WEBSITE_USE_PLACEHOLDER             = "0"
    AZURE_LOG_LEVEL                     = "info"
    AzureWebJobsDisableHomepage         = "true"
  }
}

resource "azurerm_linux_function_app" "function_app_linux" {
  depends_on                    = [azurerm_application_insights.function_app_linux]
  name                          = "redacted"
  location                      = var.location
  resource_group_name           = var.resource_group
  storage_account_name          = var.log_storage_name
  service_plan_id               = var.service_plan_id
  storage_uses_managed_identity = true
  https_only                    = true
  enabled                       = true
  builtin_logging_enabled       = false
  functions_extension_version   = "~4"
  tags                          = var.tags
  app_settings                  = merge(local.app_settings, var.app_settings)
  identity {
    type         = "SystemAssigned"
  }
  site_config {
    application_insights_connection_string = azurerm_application_insights.function_app_linux.connection_string
    application_insights_key               = azurerm_application_insights.function_app_linux.instrumentation_key
    always_on                              = true
    application_stack {
      java_version = var.java_version
    }
  }
}