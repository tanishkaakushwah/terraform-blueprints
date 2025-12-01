resource "azurerm_mssql_server" "server" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  administrator_login          = "admin"
  administrator_login_password = "admin"
}