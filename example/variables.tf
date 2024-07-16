variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "location" {
  description = "The location where the resources will be created"
  type        = string
}

variable "image_gallery_name" {
  description = "The name of the image gallery"
  type        = string
}

variable "image_definition" {
  description = "The name of the image definition"
  type        = string
}

variable "image_version" {
  description = "The version of the image"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
}