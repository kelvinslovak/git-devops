
# Resource Group existente
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Cluster AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "aksfree"

  sku_tier = "Free"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2ls_v6"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}

# IP público para o Ingress
resource "azurerm_public_ip" "ingress_ip" {
  name                = "myAKSPublicIPForIngress"
  location            = azurerm_kubernetes_cluster.aks.location
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  allocation_method   = "Static"
  sku                 = "Standard"
}
