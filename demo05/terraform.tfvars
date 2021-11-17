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
ssh_public_key_path = "etc/default_authorized_keys"
lab_source_url      = ""
webproxy_name       = "www.oradba.ch"
# label_prefix        = "none"
# ad_index            = 1
# Define Lab schedule for:
# - weekends: off 20:00-09:00, allow 09:00-20:00
# - week day: off 20:00-06:00, allow 06:00-08:00, on 08:00-18:00, allow 18:00-19:00
defined_tags        = { "Schedule.Weekend" = "0,0,0,0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0",
                        "Schedule.WeekDay" = "0,0,0,0,0,*,*,1,1,1,1,1,1,1,1,1,1,1,*,*,0,0,0,0" }

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

# Bastion Host Parameter -------------------------------------------------------
# bastion_enabled          = true
# bastion_dns_registration = true
# yum_upgrade              = false
# Define Lab schedule for:
# - weekends: off 20:00-09:00, allow 09:00-20:00
# - week day: off 20:00-06:00, allow 06:00-08:00, on 08:00-18:00, allow 18:00-19:00
# bastion_defined_tags          = { "Schedule.Weekend" = "0,0,0,0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0",
#                                   "Schedule.WeekDay" = "0,0,0,0,0,*,1,1,1,1,1,1,1,1,1,1,1,1,*,*,0,0,0,0" }
# admin_email                   = "tvd_oci_admins@trivadis.com"
# bastion_boot_volume_size      = 50
# bastion_image_id              = "OEL"
# bastion_name                  = "bastion"
# bastion_os                    = "Oracle Linux"
# bastion_os_version            = "7.9"
bastion_shape                 = "VM.Standard.E2.1.Micro"
bastion_ocpus                 = 1
bastion_memory_in_gbs         = 1
# bastion_state                 = "RUNNING"
# bastion_subnet                = []
# bootstrap_cloudinit_template  = ""
# fail2ban_template             = ""
# guacadmin_password            = ""
# guacadmin_user                = "guacadmin"
# guacamole_connections         = "scripts/guacamole_connections.sql"
# guacamole_enabled             = true
# guacamole_user                = "avocado"
# hosts_file                    = "etc/hosts.template"
# --- EOF ----------------------------------------------------------------------
