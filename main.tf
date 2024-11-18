terraform { 
  cloud { 
    
    organization = "private-acme" 

    workspaces { 
      name = "ci-demo" 
    } 
  } 
}

module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Local_Files"
  file_name = "DEV"
}
