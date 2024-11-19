terraform { 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
  backend "azurerm" { 
    resource_group_name  = "TF-Deploy"
    storage_account_name = "tfdeployaccount" 
    container_name = "tfstateblob" 
    key = "terraform.tfstate" 
    use_msi = true
  } 
}

provider "azurerm" {
  features {}
  use_msi = true
}

locals {
    yml_data = yamldecode(file("${path.module}/data.yml"))
}

module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Azure_Resource_Group"
  name = "lab-rg"
}
