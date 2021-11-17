# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: main.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.11.17
# Revision...: 
# Purpose....: Main configuration to build the environment.
# Notes......: --
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------
# - ADD VCM Module -------------------------------------------------------------
module "tvdlab-vcn" {
  source  = "Trivadis/tvdlab-vcn/oci"
  version = ">= 1.1.2"

  # - Mandatory Parameters -----------------------------------------------------
  region         = var.region
  compartment_id = oci_identity_compartment.demo06.id

  # - Optional Parameters ------------------------------------------------------
  # Lab Configuration
  resource_name    = local.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # general oci parameters
  label_prefix = lower(var.label_prefix)
  tags         = var.tags

  # VCN Network parameter
  nat_gateway_enabled      = var.nat_gateway_enabled
  internet_gateway_enabled = var.internet_gateway_enabled
  service_gateway_enabled  = var.service_gateway_enabled
  vcn_cidr                 = var.vcn_cidr
  private_netnum           = var.private_netnum
  private_newbits          = var.private_newbits
  public_netnum            = var.public_netnum
  public_newbits           = var.public_newbits

  # Trivadis LAB specific parameter 
  tvd_dns_hostnum    = var.tvd_dns_hostnum
  custom_dns_servers = var.custom_dns_servers
  tvd_private_dns    = var.tvd_private_dns
  tvd_public_dns     = var.tvd_public_dns
}

# - ADD Bastion Module ---------------------------------------------------------
module "tvdlab-bastion" {
  source  = "Trivadis/tvdlab-bastion/oci"
  version = ">= 1.3.2"

  # - Mandatory Parameters -----------------------------------------------------
  region              = var.region
  compartment_id      = oci_identity_compartment.demo06.id
  tenancy_ocid        = var.tenancy_ocid
  ssh_public_key      = local.ssh_authorized_keys
  ssh_public_key_path = var.ssh_public_key_path

  # - Optional Parameters ------------------------------------------------------
  # Lab Configuration
  resource_name    = var.resource_name
  tvd_domain       = var.tvd_domain
  tvd_participants = var.tvd_participants

  # general oci parameters
  ad_index     = var.ad_index
  label_prefix = lower(var.label_prefix)
  defined_tags = local.bastion_defined_tags
  tags         = var.tags

  # bastion parameters
  bastion_enabled              = var.bastion_enabled
  admin_email                  = var.admin_email
  bastion_boot_volume_size     = var.bastion_boot_volume_size
  bastion_dns_registration     = var.bastion_dns_registration
  bastion_image_id             = var.bastion_image_id
  bastion_memory_in_gbs        = var.bastion_memory_in_gbs
  bastion_name                 = var.bastion_name
  bastion_ocpus                = var.bastion_ocpus
  bastion_os                   = var.bastion_os
  bastion_os_version           = var.bastion_os_version
  bastion_shape                = var.bastion_shape
  bastion_state                = local.bastion_state
  bastion_subnet               = module.tvdlab-vcn.public_subnet_id
  bootstrap_cloudinit_template = var.bootstrap_cloudinit_template
  webproxy_name                = var.webproxy_name
  webhost_name                 = var.webhost_name
  fail2ban_template            = var.fail2ban_template
  guacadmin_password           = local.guacadmin_password
  guacadmin_user               = var.guacadmin_user
  guacamole_connections        = local.guacamole_connections
  guacamole_enabled            = var.guacamole_enabled
  guacamole_user               = var.guacamole_user
  hosts_file                   = local.hosts_file
  staging                      = local.staging_enabled
  yum_upgrade                  = var.yum_upgrade
}
# --- EOF ----------------------------------------------------------------------
