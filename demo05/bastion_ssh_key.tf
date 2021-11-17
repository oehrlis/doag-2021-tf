# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: bastion_ssh_key.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.05.05
# Revision...: 
# Purpose....: Create ssh keys used for guacamole ssh connection on bastion host.
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------
resource "tls_private_key" "bastion_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "random_password" "guacamole_password" {
  length  = 16
  lower   = true
  upper   = true
  number  = true
  special = false
}

resource "random_password" "tvd_password" {
  length  = 16
  lower   = true
  upper   = true
  number  = true
  special = false
}
# --- EOF ----------------------------------------------------------------------
