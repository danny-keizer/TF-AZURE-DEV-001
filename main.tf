terraform { 
  cloud { 
    
    organization = "private-acme" 

    workspaces { 
      name = "ci-demo" 
    } 
  } 
}

provider "azurerm" {
  features {}
  use_msi         = true
  client_id       = "a699511a-abee-47f1-bb88-99ff3ce72319"
  subscription_id = "cb3a8840-438d-47ae-a5fd-f815cbacb241"
  tenant_id       = "49c4cd82-8f65-4d6a-9a3b-0ecd07c0cf5b"
}

locals {
    yml_data = yamldecode(file("${path.module}/data.yml"))
}

module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Azure_Resource_Group"
  name = "lab-rg"
}
