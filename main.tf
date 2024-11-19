terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
        }
  cloud {  
    organization = "private-acme" 
    workspaces { 
      name = "ci-demo" 
    } 
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
