terraform {
  required_providers {
    aviatrix = {
      source = "aviatrixsystems/aviatrix"
    }
  }
  cloud {
    organization = "ananableu"
    workspaces {
      name = "acp-edge-demo"
    }
  }
}

provider "aviatrix" {
  controller_ip = var.controller_ip
  password      = var.admin_password
  username      = "admin"
}

provider "azurerm" {
  features {

  }
}
