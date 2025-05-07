terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# Define the resource group for the AKS cluster
resource "azurerm_resource_group" "aks" {
  name     = "ArunAKS"
  location = "West US 2"
}
# Define the AKS cluster using kubenet networking
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "arunclsu9090"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "arunclsu9090-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"  # Update to a valid VM SKU with >=2 cores and >=4GB RAM
  }

# Optional settings like Azure Active Directory integration or monitoring can be added here
 /* tags = {
    environment = "dev"
    Project     = "demoProject"  # Added new tag
  }*/
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true  # Mark the output as sensitive
}