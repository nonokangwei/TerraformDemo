terraform {
  backend "azurerm" {
    resource_group_name  = "terraformbackend"
    storage_account_name  = "tfdemostatebackend"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
    use_msi              = true
    subscription_id  = "c04b3c63-8dfe-4f98-be18-e71ff67a1f4e"
    tenant_id        = "72f988bf-86f1-41af-91ab-2d7cd011db47"
  }
}

provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.38.0"
  subscription_id = "c04b3c63-8dfe-4f98-be18-e71ff67a1f4e"
}

resource "azurerm_resource_group" "terraformdemo" {
  name     = "TFResourceGroup1"
  location = "East US"

  tags = {
    environment = "Production"
    application = "demo"
  }
}