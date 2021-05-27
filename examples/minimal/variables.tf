variable "api_key" {
  type        = string
  description = "API Key"
}
variable "secretkey" {
  type        = string
  description = "Secret Key or file location"
}
variable "endpoint" {
  type        = string
  description = "API Endpoint URL"
  default     = "https://www.intersight.com"
}
variable "organization_name" {
  type        = string
  description = "target organization name"
  default     = "default"
}
variable "mac_pool_moid" {
    type = string
    description = "moid of MAC pool for VNIC use"
}
variable "ip_pool_moid" {
    type = string
    description = "moid of IP pool for IMC use"
}