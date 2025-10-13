provider "azurerm" {
  features {}
}
# Create Resource Group
resource "azurerm_resource_group" "rsg" {
  name     = "sql-rsg"
  location = "West Europe"
}

# Create SQL server
resource "azurerm_mssql_server" "sql-server" {
  name                         = "test-sqlserver"
  resource_group_name          = azurerm_resource_group.rsg.name
  location                     = azurerm_resource_group.rsg.location
  version                      = "12.0"
  administrator_login          = "testadmin"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

# Create SQL Database
resource "azurerm_mssql_database" "sql-db" {
  name         = "test-sql-db"
  server_id    = azurerm_mssql_server.sql-server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
