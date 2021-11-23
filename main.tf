resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "production"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = [var.address_space]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "production"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.address_prefixes]
  
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method

  tags = {
    environment = "production"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  tags = {
    environment = "production"
  }
}
resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.allocation_method
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = {
    environment = "production"
  }
}
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_linux_virtual_machine" "cyntelvm" {
    name                  = var.vmname
    location              = var.resource_group_location
    resource_group_name   = var.resource_group_name
    network_interface_ids =[azurerm_network_interface.nic.id]
    size                  = var.size
    admin_username        = var.admin_username
    admin_password        = var.admin_password
    disable_password_authentication = "false"

    os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = var.publisher
        offer     = var.offer
        sku       = var.sku
        version   = "latest"
    }

    computer_name  = "virtusavm"

}