terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "staterg"
    storage_account_name = "shubhijstatesa"
    container_name       = "tfstate"
    key                  = "terraform_.tfstate"
  }
}
 