
resource "azuredevops_variable_group" "variable_group" {
  project_id   = azuredevops_project.project.id
  name         = "Devops Automation"
  description  = "Variable Group"
  allow_access = true

   variable {
     name  = "ARM_ACCESS_KEY"
     value = azurerm_storage_account.storage_account.primary_access_key
  }

  variable {
    name  = "BUNDLE_TARGET"
    value = "dev"
  }

  variable {
    name = "DATABRICKS_CLUSTER_ID"
    value = ""
  }

   variable {
    name = "databricks_host"
    value = ""
  }

   variable {
    name = "databricks_token"
    value = ""
  }

  variable {
    name = "BUNDLE_VAR_warehouse_id"
    value = ""
  }
  variable {
    name = "BUNDLE_VAR_node_type_id"
    value = ""
  }
  
  variable {
    name = "container_name"
    value = azurerm_storage_data_lake_gen2_filesystem.container.name
  }
   variable {
    name = "resource_group_name"
    value = azurerm_resource_group.resource_group.name
  }
    variable {
    name = "storage_account_name"
    value = azurerm_storage_account.storage_account.name
  }
}