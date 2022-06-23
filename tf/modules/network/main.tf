# network module main
resource "azurerm_virtual_network" "vnet" {
  name                = "${ var.resource_group_name }-vnet"
  address_space       = ["${ var.vnet_address_space }/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
# create public subnet
resource "azurerm_subnet" "public-subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-public-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${ var.vnet_address_space }/24"]
}
resource "azurerm_network_security_group" "public-NSG" {
  name                = "${azurerm_subnet.public-subnet.name}-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
# ssh
  security_rule {
    name                       = "SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix   = var.source_address_prefix  # ip with permission to access ssh
    destination_address_prefixes = azurerm_subnet.public-subnet.address_prefixes
  }
# port 8080
  security_rule {
    name                       = "PORT_8080"
    priority                   = 1010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefixes = azurerm_subnet.public-subnet.address_prefixes
  }
# inbound deny all
  security_rule {
    name                       = "deny_all"
    priority                   = 1020
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
# outbound
  security_rule {
    name                       = "outbound"
    priority                   = 2000
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefixes      = azurerm_subnet.public-subnet.address_prefixes
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "public-subnet-nsg-association" {
  subnet_id                 = azurerm_subnet.public-subnet.id
  network_security_group_id = azurerm_network_security_group.public-NSG.id
}