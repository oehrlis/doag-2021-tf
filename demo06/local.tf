# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: locals.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.05.05
# Revision...: 
# Purpose....: Local variables this terraform configuration.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------
locals {
  defined_tags         = var.destroy_date == "" ? var.defined_tags : merge(tomap({ "Schedule.DestroyDate" = var.destroy_date }), var.defined_tags)
  tvd_def_password     = var.tvd_def_password == "" ? random_password.tvd_password.result : var.tvd_def_password
  guacadmin_password   = var.guacadmin_password == "" ? random_password.guacamole_password.result : var.guacadmin_password
  staging_enabled      = var.staging_enabled ? 1 : 0
  resource_name        = var.resource_name == "" ? data.oci_identity_compartment.lab_compartment.name : var.resource_name
  resource_name_lower  = lower(local.resource_name)
  bastion_state        = var.tvd_training_state == "" ? var.bastion_state : var.tvd_training_state
  bastion_defined_tags = var.bastion_defined_tags != "" ? local.defined_tags : var.bastion_defined_tags
  resource_shortname   = lower(replace(local.resource_name, "-", ""))
  ssh_public_key_path  = var.ssh_public_key_path == "" ? "${path.root}/etc/default_authorized_keys" : var.ssh_public_key_path
  ssh_public_key       = var.ssh_public_key == "" ? file(local.ssh_public_key_path) : var.ssh_public_key
  ssh_authorized_keys  = join("", [local.ssh_public_key, tls_private_key.bastion_ssh_key.public_key_openssh])
  ssh_private_key      = var.ssh_private_key_path == "" ? tls_private_key.bastion_ssh_key.private_key_pem : file(var.ssh_private_key_path)
  hosts_file = templatefile(var.hosts_file == "" ? "${path.root}/etc/hosts.template" : var.hosts_file, {
    tvd_domain = var.tvd_domain
  })
  guacamole_connections = templatefile(var.guacamole_connections == "" ? "${path.root}/scripts/guacamole_connections.sql" : var.guacamole_connections, {
    avocado_key      = local.ssh_private_key
    tvd_os_user      = var.tvd_os_user
    tvd_def_password = local.tvd_def_password
  })
}
# --- EOF ----------------------------------------------------------------------
