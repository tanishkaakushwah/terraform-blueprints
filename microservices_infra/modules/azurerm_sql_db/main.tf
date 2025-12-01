data "azurerm_mssql_server" "server" {
  name                = var.sql_server_name
  resource_group_name = var.rg_name
}

resource "azurerm_mssql_database" "db" {
  name         = var.sql_db_name
  server_id    = data.azurerm_mssql_server.server.id  
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"
  lifecycle {
    prevent_destroy = true
  }
}