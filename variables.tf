
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
