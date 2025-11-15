# Before Terraform 1.5 (Old Way)
# You had to manually write the resource block first, then import

resource "azurerm_storage_account" "existing" {
  name                     = "mystorageacct"
  resource_group_name      = "my-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # ... manually figure out all 30+ attributes
}

# Then run: terraform import azurerm_storage_account.existing /subscriptions/.../storageAccounts/mystorageacct

# ----------------------------------------

# Terraform 1.5+ (New Way)
# Just define the import block and let Terraform generate the config

import {
  to = azurerm_storage_account.existing
  id = "/subscriptions/12345678-1234-1234-1234-123456789012/resourceGroups/my-rg/providers/Microsoft.Storage/storageAccounts/mystorageacct"
}

# Run: terraform plan -generate-config-out=generated.tf
# Terraform automatically writes the complete resource block for you!
