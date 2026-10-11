variable "identity_domains" {
  description = <<EOT
Map of identity_domains, attributes below
Required:
    - compartment_id
    - description
    - display_name
    - home_region
    - license_type
Optional:
    - admin_email
    - admin_first_name
    - admin_last_name
    - admin_user_name
    - defined_tags
    - freeform_tags
    - is_hidden_on_login
    - is_notification_bypassed
    - is_primary_email_required
    - state
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id            = string
    description               = string
    display_name              = string
    home_region               = string
    license_type              = string
    admin_email               = optional(string)
    admin_first_name          = optional(string)
    admin_last_name           = optional(string)
    admin_user_name           = optional(string)
    defined_tags              = optional(map(string))
    freeform_tags             = optional(map(string))
    is_hidden_on_login        = optional(bool)
    is_notification_bypassed  = optional(bool)
    is_primary_email_required = optional(bool)
    state                     = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.identity_domains : (
        v.state == null || (contains([for v in ["ACTIVE", "INACTIVE"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"ACTIVE\", \"INACTIVE\""
  }
}

