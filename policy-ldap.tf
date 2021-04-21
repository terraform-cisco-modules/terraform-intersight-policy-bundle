# =============================================================================
# Groups (map built-in roles to AD groups)
# -----------------------------------------------------------------------------

# Mapping of LDAP Group to EndPointRoles
resource "intersight_iam_ldap_group" "group1" {
  domain = "auslab.cisco.com"
  name   = "super_admin"
  end_point_role {
    moid        = data.intersight_iam_end_point_role.imc_admin.results[0].moid
  }
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
}
resource "intersight_iam_ldap_group" "group2" {
  domain = "auslab.cisco.com"
  name   = "WWDC Lab Users"
  end_point_role {
    moid        = data.intersight_iam_end_point_role.imc_user.results[0].moid
  }
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
}
resource "intersight_iam_ldap_group" "group3" {
  domain = "auslab.cisco.com"
  name   = "Domain Users"
  end_point_role {
    moid        = data.intersight_iam_end_point_role.imc_readonly.results[0].moid
  }
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
}


# =============================================================================
# Providers (LDAP servers)
# -----------------------------------------------------------------------------

# LDAP Provider or LDAP Server for user authentication.
resource "intersight_iam_ldap_provider" "provider1" {
  ldap_policy = [{
    additional_properties = ""
    class_id              = ""
    moid                  = intersight_iam_ldap_policy.policy1.moid
    object_type           = ""
    selector              = ""
  }]
  port   = 389
  server = "172.16.1.90"
}

resource "intersight_iam_ldap_provider" "provider2" {
  ldap_policy = [{
    additional_properties = ""
    class_id              = ""
    moid                  = intersight_iam_ldap_policy.policy1.moid
    object_type           = ""
    selector              = ""
  }]
  port   = 389
  server = "172.16.1.91"
}

# =============================================================================
# LDAP Policy
# -----------------------------------------------------------------------------

resource "intersight_iam_ldap_policy" "policy1" {
  base_properties = [{
    additional_properties      = ""
    attribute                  = "CiscoAvPair"
    base_dn                    = "dc=auslab,dc=cisco,dc=com"
    bind_dn                    = "" # why is this required?
    bind_method                = "LoginCredentials"
    class_id                   = "" # why is this required?
    domain                     = "auslab.cisco.com"
    enable_encryption          = false
    enable_group_authorization = true
    filter                     = "samAccountName"
    group_attribute            = "memberOf"
    is_password_set            = false
    nested_group_search_depth  = 128
    object_type                = "" # why is this required?
    password                   = "" # why is this required?
    timeout                    = 30
  }]
  description            = var.description
  enable_dns             = false
  enabled                = true
  name                   = "${var.policy_prefix}-ldap"
  user_search_precedence = "LDAPUserDb"
  organization {
    moid = var.organization
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
