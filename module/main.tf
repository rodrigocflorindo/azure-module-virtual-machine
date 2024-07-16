resource "azurerm_virtual_machine" "example" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    id = data.azurerm_shared_image_version.example.id
  }

  storage_os_disk {
    name              = "${var.vm_name}_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}

resource "azurerm_network_interface" "example" {
  name                = "${var.vm_name}_nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_shared_image_version" "example" {
  name                = var.image_version
  image_name          = var.image_definition
  gallery_name        = var.image_gallery_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "myVnet"
  resource_group_name  = var.resource_group_name
}