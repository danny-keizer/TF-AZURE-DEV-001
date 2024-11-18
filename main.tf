terraform { 
  cloud { 
    
    organization = "private-acme" 

    workspaces { 
      name = "ci-demo" 
    } 
  } 
}

locals {
    yml_data = yamldecode(file("${path.module}/data.yml"))
}

module "Development" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Local_Files"
  for_each = local.yml_data
  file_name = each.value.file_name
}
