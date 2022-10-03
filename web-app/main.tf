resource "random_string" "id" {
  length  = 4
  lower   = true
  numeric = true
  special = false
  upper   = false
}

resource "azurerm_resource_group" "example" {
  location = "uksouth"
  name     = "rg-web-app-${random_string.id.result}"
}

resource "azurerm_service_plan" "example" {
  location            = azurerm_resource_group.example.location
  name                = "plan-web-app-${random_string.id.result}"
  os_type             = "Linux"
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "example" {
  location            = azurerm_resource_group.example.location
  name                = "app-web-app-${random_string.id.result}"
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id
  site_config {
    always_on = false
  }
}

resource "azurerm_app_service_source_control" "example" {
  app_id                 = azurerm_linux_web_app.example.id
  branch                 = "main"
  repo_url               = "https://github.com/tobias-edwards/express-hello-world"
  use_manual_integration = true
  use_mercurial          = false
}
