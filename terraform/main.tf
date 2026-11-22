resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    Project     = "Revora-HA-PostgreSQL"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.project_name}-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "snet-aks-${var.environment}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.project_name}-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.project_name}-aks"

  default_node_pool {
    name           = "systempool"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }

  tags = {
    Environment = var.environment
  }
}