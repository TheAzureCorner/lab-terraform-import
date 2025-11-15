# Step 1: Define the import block
# This tells Terraform which resource to import and where to put it
import {
  to = azurerm_storage_account.existing
  id = "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/my-rg/providers/Microsoft.Storage/storageAccounts/mystorageacct"
}

# Step 2: Run terraform plan -generate-config-out=generated.tf
# Terraform will automatically generate the resource configuration

# The generated configuration will look something like this:
resource "azurerm_storage_account" "existing" {
  name                     = "mystorageacct"
  resource_group_name      = "my-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # All other attributes will be auto-generated
  # based on the actual resource in Azure
}
