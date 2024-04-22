# Create an Edge NEO
resource "aviatrix_edge_platform" "edge-gw-antwerpen" {

  account_name                           = local.accounts.csp_account
  gw_name                                = "edge-gw-antwerpen"
  site_id                                = "antwerpen"
  gw_size                                = "large"
  local_as_number                        = 65180
  device_id                              = aviatrix_edge_platform_device_onboarding.edge-1012.device_id
  management_egress_ip_prefix_list       = ["${data.dns_a_record_set.ferme.addrs[0]}/32"]
  enable_management_over_private_network = false
  management_interface_names             = ["eth2"]
  lan_interface_names                    = ["eth4"]
  wan_interface_names                    = ["eth2"]



  interfaces {
    name          = "eth0"
    type          = "WAN"
    ip_address    = "192.168.15.5/24"
    gateway_ip    = "192.168.15.1"
    wan_public_ip = data.dns_a_record_set.ferme.addrs[0]
  }

  interfaces {
    name        = "eth1"
    type        = "LAN"
    ip_address  = "192.168.180.1/24"
    enable_dhcp = false
  }

  interfaces {
    name        = "eth2"
    type        = "MANAGEMENT"
    enable_dhcp = true
  }
}

# Attach edge to transit
resource "aviatrix_edge_spoke_transit_attachment" "edge-antwerpen-transit" {
  spoke_gw_name               = aviatrix_edge_platform.edge-gw-antwerpen.gw_name
  transit_gw_name             = data.tfe_outputs.dataplane.values.transit_azr_r1_name
  enable_over_private_network = false
  depends_on                  = [aviatrix_edge_platform.edge-gw-antwerpen]
}
