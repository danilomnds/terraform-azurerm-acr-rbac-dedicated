variable "scope" {
  type = string
}

variable "role_assignment" {
  type = map(map(string))
}

variable "reader_permission_on_rg" {
  description = "Whether reader permission will be granted on rg scope"
  default     = false
}

variable "reader_permission_on_acr" {
  description = "Whether reader permission will be granted on rg scope"
  default     = false
}