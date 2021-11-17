# ---------------------------------------------------------------------------
# Trivadis AG, Infrastructure Managed Services
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: vcn.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2020.10.12
# Revision...: 
# Purpose....: Define VCN resources for the terraform module tvdlab vcn.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# VCN resource --------------------------------------------------------------
resource "oci_core_vcn" "vcn" {
  cidr_block     = var.vcn_cidr
  compartment_id = oci_identity_compartment.demo03.id
  display_name   = var.label_prefix == "none" ? "${local.resource_shortname}%02d" : "${var.label_prefix} ${local.resource_shortname}"
  dns_label      = local.resource_shortname
  freeform_tags  = var.tags
}

# create public DHCP option -------------------------------------------------
resource "oci_core_default_dhcp_options" "public_dhcp_option" {
  manage_default_resource_id = oci_core_vcn.vcn.default_dhcp_options_id
  display_name               = var.label_prefix == "none" ? "${local.resource_shortname} public dhcp" : "${var.label_prefix} ${local.resource_shortname}%02d public dhcp"

  options {
    custom_dns_servers = []
    server_type        = "VcnLocalPlusInternet"
    type               = "DomainNameServer"
  }

  options {
    search_domain_names = [
      "${local.resource_shortname}.oraclevcn.com",
    ]
    type = "SearchDomain"
  }
}

# create private DHCP option ------------------------------------------------
resource "oci_core_dhcp_options" "private_dhcp_option" {
  compartment_id = oci_identity_compartment.demo03.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.label_prefix == "none" ? "${local.resource_shortname} private dhcp" : "${var.label_prefix} ${local.resource_shortname} private dhcp"

  # domain names server
  options {
    type               = "DomainNameServer"
    server_type        = "CustomDnsServer"
    custom_dns_servers = local.custom_dns_servers
  }

  # search domain
  options {
    type                = "SearchDomain"
    search_domain_names = [var.tvd_domain]
  }
}

# create the internet gateway resource --------------------------------------
resource "oci_core_internet_gateway" "igw" {
  compartment_id = oci_identity_compartment.demo03.id
  display_name   = var.label_prefix == "none" ? "${local.resource_shortname}_igw" : "${var.label_prefix} ${local.resource_shortname}_igw"

  vcn_id        = oci_core_vcn.vcn.id
  enabled       = "true"
  freeform_tags = var.tags
}

# create a default routing table --------------------------------------------
resource "oci_core_default_route_table" "default_route_table" {
  display_name               = var.label_prefix == "none" ? "${local.resource_shortname} internet route" : "${var.label_prefix} ${local.resource_shortname} internet route"
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  freeform_tags              = var.tags

  route_rules {
    destination       = local.anywhere
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}
# --- EOF -------------------------------------------------------------------
