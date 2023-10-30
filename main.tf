terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm ={
        source = "hashicorp/azurerm"
        version = ">= 3.43.0"
    }
  }
  cloud {
    organization = "dataconsult"
    workspaces {
      name = "TerraformCI"
    }
  }
}
provider "azurerm" {
  features {
  }
  skip_provider_registration = true
}


resource "azurerm_resource_group" "rg" {
  name=""
  location = ""
}

resource "azurerm_storage_account" "stroageaccount" {
  location = azurerm_resource_group.rg.location
  account_replication_type = "LRS"
  account_tier = "standard"
  name = "sg123"
  resource_group_name = azurerm_resource_group.rg.name
}