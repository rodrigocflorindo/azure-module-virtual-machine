module "vm" {
  source              = "../module"
  resource_group_name = var.resource_group_name
  vm_name             = var.vm_name
  location            = var.location
  image_gallery_name  = var.image_gallery_name
  image_definition    = var.image_definition
  image_version       = var.image_version
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
  count    = length(data.azurerm_resource_group.existing_resource_group.name) == 0 ? 1 : 0
}

data "azurerm_resource_group" "existing_resource_group" {
  name = var.resource_group_name
}