provider "azurerm" {
  features {}
}

terraform { 
  backend "azurerm" { 
    storage_account_name = "tfdeployaccount" 
    container_name = "tfstateblob" 
    key = "terraform.tfstate" 
  } 
}

locals {
    yml_data = yamldecode(file("${path.module}/data.yml"))
}

module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Azure_Resource_Group"
  name = "lab-rg"
}
