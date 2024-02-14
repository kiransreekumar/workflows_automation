
resource "azuredevops_variable_group" "variable_group" {
  project_id   = azuredevops_project.project.id
  name         = "Devops Automation"
  description  = "Variable Group"
  allow_access = true

  # variable {
  #   name  = "ARM_ACCESS_KEY"
  #   value = ""
  # }

  variable {
    name         = "BUNDLE_TARGET"
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

}