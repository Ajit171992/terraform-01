resource "azurerm_resource_group" "rg-01" {
  name = "azure-rg-01"
  location = "west europe"
}

resource "azurerm_storage_account" "sa-01" {
  name = "sa01we"
  resource_group_name = azurerm_resource_group.rg-01.name
  location = azurerm_resource_group.rg-01.location
  account_tier = "Standard"
  account_replication_type = "GRS"
}

  resource "azurerm_storage_container" "ct-01" {
    name = "ct01we"
    storage_account_name = azurerm_storage_account.sa-01.name
    container_access_type = "container" # "blob" "private"
  }
