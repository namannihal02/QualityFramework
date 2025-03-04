provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my-rg"   # Hardcoded name
  location = "East US" # Hardcoded location
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"  # Invalid: Storage account names must be globally unique
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"   # Deprecated attribute in some versions

  tags = {
    environment = "production"
  }
}
