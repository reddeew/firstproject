terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
 
  subscription_id = "af25451b-7dc6-4d68-8386-ffab0658969f"
  tenant_id       = "5a9b42c1-3185-4b27-a958-6c7b00ca40bf"
  client_id       = "0213f8cc-2ae5-4a1f-88b7-41916334cdd8"
  client_secret   = "RmW8Q~MaqkJ_wBPrybU3Lnsb7tKbkit1~h49ybY."
}
# Create a resource group
resource "azurerm_resource_group" "tf_test" {
    name = "tf_azure_group"
    location =  "West Europe"
}
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "tf_test" {
  name                = "tf-network"
  resource_group_name = azurerm_resource_group.tf_test.name
  location            = azurerm_resource_group.tf_test.location
  address_space       = ["10.0.0.0/16"]
}
