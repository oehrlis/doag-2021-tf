# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: terraform.tfvars
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.06.21
# Revision...: 
# Purpose....: Terraform Variable file.
# Notes......: 
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------

# defined by environment variables ---------------------------------------------
# fingerprint                 = ""
# private_key_path            = ""
# tenancy_ocid                = ""
# user_ocid                   = ""

# provider identity parameters -------------------------------------------------
region = "eu-zurich-1"

# general oci parameters -------------------------------------------------------
resource_name       = "DOAG-Lab"
software_user       = "x"
software_password   = ""
software_repo       = "https://swiftobjectstorage.eu-zurich-1.oraclecloud.com/v1/zrtfpr9zz2nz/orarepo"
tvd_def_password    = "LAB42-Schulung"
lab_source_url      = ""

# Trivadis LAB specific parameter ----------------------------------------------
# tvd_participants   = 1
tvd_domain         = "oci.oradba.ch"
# tvd_dns_hostnum    = 4
custom_dns_servers = ["8.8.8.8"]
# tvd_private_dns    = "default"
# tvd_public_dns     = "8.8.8.8"
# tvd_os_user        = "oracle"
# tvd_training_state = "RUNNING"

# VCN parameters ---------------------------------------------------------------
# internet_gateway_enabled    = true
# nat_gateway_enabled         = true
# service_gateway_enabled     = false
# vcn_cidr                    = "10.0.0.0/16"
# public_netnum               = 0
# public_newbits              = 8
# private_netnum              = 1
# private_newbits             = 8
# --- EOF ----------------------------------------------------------------------
