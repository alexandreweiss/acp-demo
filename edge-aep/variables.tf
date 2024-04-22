variable "admin_password" {
  sensitive   = true
  description = "Admin password"
}

variable "controller_ip" {
  description = "IP or FQDN of the target Aviatrix controller"
  type        = string
}


variable "ferme_fqdn" {
  description = "FQDN of Ferme ISP"
  sensitive   = true
}

locals {
  accounts = {
    csp_account = "prodPlatform"
  }
}
