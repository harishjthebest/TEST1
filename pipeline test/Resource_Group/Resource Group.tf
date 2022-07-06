resource "azurerm_resource_group" "TestRG" {
  name     = var.resource_group
  location = var.location
}
