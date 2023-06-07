variable "role_name" {
  description = "Role name"
  type        = string
}

variable "trusted_role_actions" {
  description = "Actions of STS"
  type        = list(string)
  default     = ["sts:AssumeRole"]
}

variable "trusted_role_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_role_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = []
}

variable "attach_admin_policy" {
  description = "Attach admin policy"
  type        = bool
  default     = false
}

variable "attach_readonly_policy" {
  description = "Attach readonly policy"
  type        = bool
  default     = false
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile"
  type        = bool
  default     = false
}

############################
### Pre-defined policies ###
############################

variable "admin_role_policy_arn" {
  description = "Policy ARN to use for admin role"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

variable "readonly_role_policy_arn" {
  description = "Policy ARN to use for RO role"
  type        = string
  default     = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
