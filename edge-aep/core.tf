data "tfe_outputs" "dataplane" {
  organization = "ananableu"
  workspace    = "acp-demo"
}

data "dns_a_record_set" "ferme" {
  host = var.ferme_fqdn
}
