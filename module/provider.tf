terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.99.0"  # Certifique-se de usar uma versão que suporte o bloco security_profile
    }
  }
}

provider "azurerm" {
  features {}
}