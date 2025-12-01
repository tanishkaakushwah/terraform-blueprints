module "rg" {
  source = "../../modules/rg"
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "acr" {
    depends_on = [ module.rg ]
    source = "../../modules/azure_container_registry"
    acr_name       = var.acr_name
    rg_name = var.rg_name
    rg_location = var.rg_location
}

module "aks" {
  depends_on = [ module.rg, module.acr ]
  source = "../../modules/azure_k8s_service"
    aks_name       = var.aks_name
    rg_name        = var.rg_name
    rg_location    = var.rg_location
    dns=var.dns
    acr_name = var.acr_name
}

module "sql_server" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_sql_server"
    sql_server_name       = var.sql_server_name
    rg_name        = var.rg_name
    rg_location    = var.rg_location
}

module "sql_db" {
  depends_on = [ module.sql_server ]
  source = "../../modules/azurerm_sql_db"
    sql_server_name       = var.sql_server_name
    sql_db_name       = var.sql_db_name
    rg_name        = var.rg_name
  
}