provider "azurerm" {
features {}
version= "~>3.0"
}

resource "azurerm_resource_group" "test"{
name="TestRG"
location= "East US"
}

resource "azurerm_storage_account" "storacc"{
 name   =  "myStorageAccount"
resource_group_name= azurerm_resource_group.test.name
location=   azurerm_resource_group.test.location
account_tier=   "Standard"
 account_replication_type = "LRS"
tags={Env="Dev"
    Owner="Admin"}
}

resource "azurerm_virtual_network" "vnet1" {
name ="MyVNET"
 address_space=["10.0.0.0/16"]
location=azurerm_resource_group.test.location
resource_group_name=azurerm_resource_group.test.name
}

resource "azurerm_subnet" "sub1"{
name="MySubnet"
virtual_network_name=azurerm_virtual_network.vnet1.name
resource_group_name=azurerm_resource_group.test.name
address_prefixes=["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nic1"{
name="MyNIC"
location=azurerm_resource_group.test.location
resource_group_name=azurerm_resource_group.test.name
ip_configuration {
name="internal"
subnet_id=azurerm_subnet.sub1.id
private_ip_address_allocation="Dynamic"
}
}

resource "azurerm_public_ip" "pubip1"{
name=   "MyPublicIP"
location=azurerm_resource_group.test.location
resource_group_name=azurerm_resource_group.test.name
allocation_method="Static"
}
