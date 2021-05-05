
variable "description" {
  type        = string
  description = "description field for all policies"
  default     = "Created by Terraform. Do not edit manually."
}

variable "policy_prefix" {
  type        = string
  description = "prefix for all policies created"
  default     = "terraform-standard"
}

variable "organization" {
  type        = string
  description = "moid for organization in which to create the policies"
}

variable "tags" {
  type        = list(map(string))
  description = "user tags to be applied to all policies"
}

variable "server_ports_6454" {
  type = set(string)
  description = "list of port numbers to be assigned to server ports"
}
variable "port_channel_6454" {
  type = set(string)
  description = "list of port numbers to be assigned to uplink port channel"
}
variable "fc_port_count_6454" {
  type = number
  description = "number of ports to assign to FC starting at port 1"
  default = 0
}
variable "uplink_vlans_6454" {
  type = map(number)
  description = "map of vlan names and IDs to be used on FI uplinks"
}

variable "imc_access_pool" {
  type = string
  description = "moid of IP pool for IMC access"
}
variable "imc_access_vlan" {
  type = number
  description = "ID of VLAN for IMC access"
}