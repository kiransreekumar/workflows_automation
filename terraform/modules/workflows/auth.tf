variable "databricks_connection_profile" {
  description = "The name of the Databricks connection profile to use."
  type        = string
}


# Initialize the Databricks Terraform provider.
terraform {
  required_providers {
    databricks = {
      source = "databricks/databricks"
    }
  }
}

terraform {
  backend "azurerm" {
  }
}
# Use Databricks CLI authentication.
provider "databricks" {
}
# Retrieve information about the current user.
data "databricks_current_user" "me" {}
