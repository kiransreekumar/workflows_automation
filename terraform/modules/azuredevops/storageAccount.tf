
data "azurerm_client_config" "current" { }

data "azuread_user" "current_user" {
  object_id = data.azurerm_client_config.current.object_id
}



resource "azurerm_resource_group" "resource_group" {
  name     = replace("${lower(data.azuread_user.current_user.mail_nickname)}arg",".","")
  location = "uksouth"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = replace("${lower(data.azuread_user.current_user.mail_nickname)}asa",".","")
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  tags = {
    owner = data.azuread_user.current_user.user_principal_name
  }
}

resource "azurerm_storage_data_lake_gen2_filesystem" "container" {
  name               = "statestore"
  storage_account_id = azurerm_storage_account.storage_account.id
}




