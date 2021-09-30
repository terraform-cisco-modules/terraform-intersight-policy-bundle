# =============================================================================
# External references
# -----------------------------------------------------------------------------

variable "organization" {
  type        = string
  description = "moid for organization in which to create the policies"
}
variable "vnic_mac_pool" {
  type        = string
  description = "moid of MAC pool for use with vnics"
}
variable "imc_access_pool" {
  type        = string
  description = "moid of IP pool for IMC access"
}


# =============================================================================
# Naming and tagging
# -----------------------------------------------------------------------------

variable "policy_prefix" {
  type        = string
  description = "prefix for all policies created"
  default     = "tf"
}
variable "description" {
  type        = string
  description = "description field for all policies"
  default     = ""
}
variable "tags" {
  type        = list(map(string))
  description = "user tags to be applied to all policies"
  default     = []
}


# =============================================================================
# Fabric Interconnect ports and VLANs
# -----------------------------------------------------------------------------

variable "server_ports_6454" {
  type        = set(string)
  description = "list of port numbers to be assigned to server ports"
}
variable "port_channel_6454" {
  type        = set(string)
  description = "list of port numbers to be assigned to uplink port channel"
}
variable "fc_port_count_6454" {
  type        = number
  description = "number of ports to assign to FC starting at port 1"
  default     = 0
}
variable "uplink_vlans_6454" {
  type        = map(number)
  description = "map of vlan names and IDs to be used on FI uplinks"
}
variable "vnic_native_vlan" {
  type        = number
  description = "native VLAN for vnic profiles"
  default     = 1
}


# =============================================================================
# IMC
# -----------------------------------------------------------------------------

variable "imc_access_vlan" {
  type        = number
  description = "ID of VLAN for IMC access"
}
variable "imc_admin_password" {
  type        = string
  description = "password for the local user policy for IMC"
  default     = "Cha@ng3Me"
}


# =============================================================================
# IPs
# -----------------------------------------------------------------------------

variable "ntp_servers" {
  type        = list(string)
  description = "list of NTP servers"
}
variable "ntp_timezone" {
  type        = string
  description = "valid timezone as documented at https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ntp_policy"
  default     = "America/Chicago"
}
variable "dns_preferred" {
  type        = string
  description = "IP address of primary (preferred) DNS server"
}
variable "dns_alternate" {
  type        = string
  description = "IP address of secondary (alternate) DNS server"
  default     = ""
}
