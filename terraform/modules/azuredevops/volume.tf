resource "databricks_catalog" "wheel_catalog" {
  name    = "wheel_catalog"
  comment = "this catalog is used for wheel file testing in volumes"
  properties = {
    purpose = "testing wheel file in volumes"
  }
}

resource "databricks_schema" "wheel_schema" {
  catalog_name = databricks_catalog.wheel_catalog.id
  name         = "wheel_schema"
  comment      = "this database is used for wheel file testing in volumes"
  properties = {
    kind = "various"
  }
}

resource "databricks_volume" "this" {
  name             = "wheel_volume"
  catalog_name     = databricks_catalog.wheel_catalog.name
  schema_name      = databricks_schema.wheel_schema.name
  volume_type      = "MANAGED"
  comment          = "this volume is used for wheel file testing in volumes"
}