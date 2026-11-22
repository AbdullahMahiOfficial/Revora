terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "32702f5b-0883-4369-892e-ed5adcbd6d0b"
  resource_provider_registrations = "none"
}