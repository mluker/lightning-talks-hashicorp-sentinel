terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = var.azure_subscription_id
}

resource "azurerm_resource_group" "this" {
  name     = "rg-lightning-talk-sentinel"
  location = "eastus"
}

resource "azurerm_storage_account" "this" {
  name                     = "stligntningtalk"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = "westus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}