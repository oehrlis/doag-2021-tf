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
  defined_tags        = var.destroy_date == "" ? var.defined_tags : merge(tomap({ "Schedule.DestroyDate" = var.destroy_date }), var.defined_tags)
  resource_name       = var.resource_name == "" ? data.oci_identity_compartment.lab_compartment.name : var.resource_name
  resource_name_lower = lower(local.resource_name)
  resource_shortname  = lower(replace(local.resource_name, "-", ""))
}
# --- EOF ----------------------------------------------------------------------
