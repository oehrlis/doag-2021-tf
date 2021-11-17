# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: subnets.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Define subnets for the terraform module tvdlab vcn.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# create public subnet ------------------------------------------------------
resource "oci_core_subnet" "public_subnet" {
  compartment_id    = oci_identity_compartment.demo03.id
  cidr_block        = cidrsubnet(var.vcn_cidr, var.public_newbits, var.public_netnum)
  display_name      = var.label_prefix == "none" ? "${local.resource_shortname} public subnet" : "${var.label_prefix} ${local.resource_shortname} public subnet"
  dns_label         = local.public_dns_label
  vcn_id            = oci_core_vcn.vcn.id
  security_list_ids = [oci_core_vcn.vcn.default_security_list_id]
  route_table_id    = oci_core_vcn.vcn.default_route_table_id
  dhcp_options_id   = oci_core_vcn.vcn.default_dhcp_options_id
}

# create private subnet -----------------------------------------------------
resource "oci_core_subnet" "private_subnet" {
  compartment_id             = oci_identity_compartment.demo03.id
  cidr_block                 = cidrsubnet(var.vcn_cidr, var.private_newbits, var.private_netnum)
  display_name               = var.label_prefix == "none" ? "${local.resource_shortname} private subnet" : "${var.label_prefix} ${local.resource_shortname} private subnet"
  dns_label                  = local.private_dns_label
  prohibit_public_ip_on_vnic = true
  vcn_id                     = oci_core_vcn.vcn.id
  security_list_ids          = [oci_core_vcn.vcn.default_security_list_id]
  route_table_id             = oci_core_route_table.private_route_table.id
  dhcp_options_id            = oci_core_dhcp_options.private_dhcp_option.id
}
# --- EOF -------------------------------------------------------------------
