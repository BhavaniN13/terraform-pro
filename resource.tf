#resource group 
resource "azurerm_resource_group" "terraAzure" {
    name     = "Casestudy1"
    location = "East US"
}

#storage Account 
resource "azurerm_storage_account" "terraStorage" {
  name                     = "casestudy1storage13"   
  resource_group_name      = azurerm_resource_group.terraAzure.name
  location                 = azurerm_resource_group.terraAzure.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CaseStudy"
  }
}


# blob container 
# Blob Container
resource "azurerm_storage_container" "terraContainer" {
  name                  = "casestudycontainer13"
  storage_account_name  = azurerm_storage_account.terraStorage.name
  container_access_type = "private"  # options: "private", "blob", or "container"

  metadata = {
    environment = "CaseStudy"
  }
}


