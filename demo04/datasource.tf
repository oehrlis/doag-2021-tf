# ---------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ---------------------------------------------------------------------------
# Name.......: datasource.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.05.05
# Revision...: 
# Purpose....: Get information on linux images and LAB compartment
# Notes......: -- 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ---------------------------------------------------------------------------

# define the Oracle linux image
# data "oci_core_images" "oracle_images" {
#   compartment_id           = oci_identity_compartment.demo04.id
#   operating_system         = var.bastion_os
#   operating_system_version = var.bastion_os_version
#   shape                    = var.bastion_shape
#   sort_by                  = "TIMECREATED"
# }

# get the compartment information
data "oci_identity_compartment" "lab_compartment" {
  #Required
  id = oci_identity_compartment.demo04.id
}
# --- EOF -------------------------------------------------------------------
