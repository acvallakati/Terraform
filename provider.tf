terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "autoshutdown"
    storage_account_name = "statefilesta1sql"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    // client_secret        = ""
    // client_id            = "3264b48f-3a31-4c37-82bf-161e56f4fd2d"
    // sub_id               = "eeaf57fe-8f95-4615-90d2-8ecd4129fbda"
    // tenant_id            = "af9a07df-140a-4a28-8035-3372e5cee7cc"
  }
}
