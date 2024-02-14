terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.11.0"
    }
    databricks = {
      source = "databricks/databricks"
    }
  }
}

provider "azuredevops" {
  # Configuration options
}

provider "azurerm" {
  subscription_id = "3f2e4d32-8e8d-46d6-82bc-5bb8d962328b"
  features {}
}

# Use Databricks CLI authentication.
provider "databricks" {
}

# Retrieve information about the current user.
data "databricks_current_user" "me" {}
