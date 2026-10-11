resource "oci_identity_domain" "identity_domains" {
  for_each = var.identity_domains

  compartment_id            = each.value.compartment_id
  description               = each.value.description
  display_name              = each.value.display_name
  home_region               = each.value.home_region
  license_type              = each.value.license_type
  admin_email               = each.value.admin_email
  admin_first_name          = each.value.admin_first_name
  admin_last_name           = each.value.admin_last_name
  admin_user_name           = each.value.admin_user_name
  defined_tags              = each.value.defined_tags
  freeform_tags             = each.value.freeform_tags
  is_hidden_on_login        = each.value.is_hidden_on_login
  is_notification_bypassed  = each.value.is_notification_bypassed
  is_primary_email_required = each.value.is_primary_email_required
  state                     = each.value.state

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

