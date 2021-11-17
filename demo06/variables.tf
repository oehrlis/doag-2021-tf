# ------------------------------------------------------------------------------
# Trivadis - Part of Accenture, Platform Factory - Transactional Data Platform
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# ------------------------------------------------------------------------------
# Name.......: variables.tf
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2021.11.17
# Revision...: 
# Purpose....: Variable file for the terraform configuration.
# Notes......: --
# Reference..: --
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# ------------------------------------------------------------------------------
# provider identity parameters ------------------------------------------------
variable "user_ocid" {
  description = "user OCID used to access OCI"
  default     = ""
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint for user"
  default     = ""
  type        = string
}

variable "private_key_path" {
  description = "Private Key Path"
  default     = ""
  type        = string
}

variable "tenancy_ocid" {
  description = "tenancy id where to create the resources"
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The OCI region where resources will be created"
  type        = string
}
# general oci parameters ----------------------------------------------------
# variable "compartment_ocid" {
#   description = "OCID of the compartment where to create all resources"
#   type        = string
# }

variable "label_prefix" {
  description = "A string that will be prepended to all resources"
  type        = string
  default     = "none"
}

variable "resource_name" {
  description = "user-friendly string to name all resource. If undefined it will be derived from compartment name. "
  type        = string
  default     = ""
}

variable "ad_index" {
  description = "The index of the availability domain. This is used to identify the availability_domain place the compute instances."
  default     = 1
  type        = number
}

variable "destroy_date" {
  description = "Date by when this OCI stack has to be destroyed / deleted. The destroy job runs daily at 23:00 and checks for this value."
  type        = string
  default     = ""
}

variable "defined_tags" {
  description = "Defined tags for this resource"
  type        = map(any)
  default = { "Schedule.Weekend" = "0,0,0,0,0,0,0,0,*,*,*,*,*,*,*,*,*,*,*,*,0,0,0,0",
  "Schedule.WeekDay" = "0,0,0,0,0,*,1,1,1,1,1,1,1,1,1,1,1,1,*,*,0,0,0,0" }
}

variable "tags" {
  description = "A simple key-value pairs to tag the resources created"
  type        = map(any)
  default     = {}
}

# VCN parameters --------------------------------------------------------------
variable "internet_gateway_enabled" {
  description = "whether to create the internet gateway"
  default     = true
  type        = bool
}

variable "nat_gateway_enabled" {
  description = "whether to create a nat gateway in the vcn"
  default     = true
  type        = bool
}

variable "service_gateway_enabled" {
  description = "whether to create a service gateway"
  default     = false
  type        = bool
}

variable "vcn_cidr" {
  description = "cidr block of VCN"
  default     = "10.0.0.0/16"
  type        = string
}

# Public Subnet parameters ----------------------------------------------------
variable "public_netnum" {
  description = "0-based index of the bastion subnet when the VCN's CIDR is masked with the corresponding newbit value."
  default     = 0
  type        = number
}

variable "public_newbits" {
  description = "The difference between the VCN's netmask and the desired bastion subnet mask"
  default     = 8
  type        = number
}

# Public Subnet parameters ----------------------------------------------------
variable "private_netnum" {
  description = "0-based index of the private subnet when the VCN's CIDR is masked with the corresponding newbit value."
  default     = 1
  type        = number
}

variable "private_newbits" {
  description = "The difference between the VCN's netmask and the desired private subnet mask"
  default     = 8
  type        = number
}
# Trivadis LAB specific parameter ---------------------------------------------
variable "lab_source_url" {
  description = "preauthenticated URL to the LAB source ZIP file."
  default     = ""
  type        = string
}

variable "tvd_participants" {
  description = "The number of VCNs to create"
  type        = number
  default     = 1
}

variable "tvd_training_state" {
  description = "Define the state of the training either RUNNING or STOPPED default is undefined"
  type        = string
  default     = "RUNNING"
}

variable "tvd_domain" {
  description = "The domain name of the LAB environment"
  type        = string
  default     = "trivadislabs.com"
}

variable "tvd_dns_hostnum" {
  description = "The host number for the Trivadis LAB DNS server. This number is used to build the IP address using cidrhost function"
  type        = number
  default     = 4
}

variable "custom_dns_servers" {
  description = "List of custom DNS server"
  type        = list(string)
  default     = []
}

variable "tvd_private_dns" {
  description = "A private DNS IP address for the training environment"
  type        = string
  default     = "default"
}

variable "tvd_public_dns" {
  description = "A public DNS IP address for the training environment"
  type        = string
  default     = "8.8.8.8"
}

variable "tvd_os_user" {
  description = "Default OS user used to bootstrap"
  default     = "oracle"
  type        = string
}

variable "software_repo" {
  description = "Software repository URL to OCI object store swift API"
  default     = "https://swiftobjectstorage.eu-zurich-1.oraclecloud.com/v1/trivadisbdsxsp/orarepo"
  type        = string
}

variable "software_user" {
  description = "Default OCI user to access the software repository"
  default     = ""
  type        = string
}

variable "software_password" {
  description = "Default OCI password to access the software repository"
  default     = ""
  type        = string
}

variable "tvd_def_password" {
  description = "Default password for windows administrator, oracle, directory and more"
  type        = string
}

# Bastion Host Parameter ------------------------------------------------------
variable "bastion_enabled" {
  description = "whether to create the bastion"
  default     = true
  type        = bool
}

variable "bastion_dns_registration" {
  description = "whether to register the bastion host in DNS zone"
  default     = true
  type        = bool
}

variable "bastion_name" {
  description = "Name portion of bastion host"
  default     = "bastion"
  type        = string
}

variable "webhost_name" {
  description = "web host name used configure nginx / dns"
  default     = ""
  type        = string
}

variable "webproxy_name" {
  description = "web proxy name used configure nginx"
  default     = ""
  type        = string
}

variable "bastion_image_id" {
  description = "Provide a custom image id for the bastion host or leave as OEL (Oracle Enterprise Linux)."
  default     = "OEL"
  type        = string
}

variable "bastion_os" {
  description = "Base OS for the bastion host."
  default     = "Oracle Linux"
  type        = string
}

variable "bastion_os_version" {
  description = "Define Base OS version for the bastion host."
  default     = "7.9"
  type        = string
}

variable "bastion_shape" {
  description = "The shape of bastion instance."
  default     = "VM.Standard.E4.Flex"
  type        = string
}

variable "bastion_ocpus" {
  description = "The ocpus for the shape."
  default     = 1
  type        = number
}

variable "bastion_memory_in_gbs" {
  description = "The memory in gbs for the shape."
  default     = 4
  type        = number
}
variable "bastion_boot_volume_size" {
  description = "Size of the boot volume."
  default     = 50
  type        = number
}

variable "bastion_state" {
  description = "Whether bastion host should be either RUNNING or STOPPED state. "
  default     = "RUNNING"
}

variable "bootstrap_cloudinit_template" {
  description = "Bootstrap script. If left out, it will use the embedded cloud-init configuration to boot the bastion host."
  default     = ""
  type        = string
}

variable "bastion_defined_tags" {
  description = "Defined tags for this resource"
  type        = map(any)
  default     = {}
}

variable "ssh_public_key" {
  description = "the content of the ssh public key used to access the bastion. set this or the ssh_public_key_path"
  default     = ""
  type        = string
}

variable "ssh_public_key_path" {
  description = "path to the ssh public key used to access the bastion. set this or the ssh_public_key"
  default     = ""
  type        = string
}

variable "ssh_private_key_path" {
  description = "path to the ssh private key used to access the internal hosts."
  default     = ""
  type        = string
}

variable "generate_public_ssh_key" {
  default = true
}

variable "bastion_subnet" {
  description = "List of subnets for the bastion hosts"
  type        = list(string)
  default     = []
}

variable "hosts_file" {
  description = "Content of a custom host file which has to be appended to /etc/hosts"
  default     = ""
  type        = string
}


variable "yum_upgrade" {
  description = "Enable YUM upgrade during bootstrap / cloud-init"
  default     = true
  type        = bool
}

variable "guacamole_enabled" {
  description = "whether to configure guacamole or not"
  default     = true
  type        = bool
}

variable "guacamole_connections" {
  description = "path to a custom guacamole connections SQL script"
  default     = ""
  type        = string
}

variable "fail2ban_template" {
  description = "path to a fail2ban configuration template file"
  default     = ""
  type        = string
}

variable "guacamole_user" {
  description = "Guacamole OS user name"
  default     = "avocado"
  type        = string
}

variable "guacadmin_user" {
  description = "Guacamole console admin user"
  default     = "guacadmin"
  type        = string
}

variable "guacadmin_password" {
  description = "Guacamole console admin user password. If password is empty it will be autogenerate during setup."
  default     = ""
  type        = string
}

variable "admin_email" {
  description = "Admin email used to configure Let's encrypt."
  default     = "admin@domain.com"
  type        = string
}

variable "staging_enabled" {
  description = "Set to TRUE if you're testing your setup to avoid hitting request limits"
  default     = false
  type        = bool
}
# --- EOF ----------------------------------------------------------------------
