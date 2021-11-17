# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: oucompartmenttput.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.11.17
# Revision...: 
# Purpose....: Compartment resource for the terraform configuration.
# Notes......: --
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------
resource "oci_identity_compartment" "demo06" {
  compartment_id = var.tenancy_ocid
  description    = "DOAG Demo 06 Compartment"
  name           = "DEMO06"
  enable_delete  = true
}

# --- EOF ----------------------------------------------------------------------
