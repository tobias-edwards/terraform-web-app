# Generate a random integer to create a (globally) unique name
resource "random_string" "id" {
  length  = 4
  lower   = true
  numeric = true
  special = false
  upper   = false
}

# Resource Group - groups resources for easier management
resource "azurerm_resource_group" "example" {
  name     = "rg-example-${random_string.id.result}"
  location = "uksouth"
}

# App Service plan - defines the set of compute resources to run on (money, money, money)
resource "azurerm_service_plan" "example" {
  name                = "plan-example-${random_string.id.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "F1" # Free!
}

# App Service - Linux-based web app configuration
resource "azurerm_linux_web_app" "example" {
  name                = "app-example-${random_string.id.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id
  https_only          = true

  site_config {
    always_on         = false
    use_32_bit_worker = true

    application_stack {
      node_version = "16-lts"
    }
  }
}

# Deployment centre - deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "example" {
  app_id                 = azurerm_linux_web_app.example.id
  repo_url               = var.repo_url
  branch                 = var.repo_branch
  use_manual_integration = true
  use_mercurial          = false
}
