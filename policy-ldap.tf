# =============================================================================
# Local users
# -----------------------------------------------------------------------------
resource "intersight_iam_end_point_user_policy" "user_policy1" {
  name        = "${var.policy_prefix}-local-user"
  description = var.description

  password_properties {
    enforce_strong_password  = true
    enable_password_expiry   = false
    password_expiry_duration = 50
    password_history         = 5
    notification_period      = 1
    grace_period             = 2
    force_send_password      = true
  }
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
  # add policy to the specified server profile template
  profiles {
    moid        = intersight_server_profile_template.template1.moid
    object_type = "server.ProfileTemplate"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

# Mapping of endpoint user to endpoint roles.
resource "intersight_iam_end_point_user_role" "roleadmin" {
  enabled = true
  end_point_role {
    moid        = data.intersight_iam_end_point_role.admin_role.results[0].moid
    object_type = data.intersight_iam_end_point_role.admin_role.results[0].object_type
  }
  end_point_user {
    moid        = intersight_iam_end_point_user.iam_end_point_user1.moid
    object_type = intersight_iam_end_point_user.iam_end_point_user1.object_type
  }
  end_point_user_policy {
    moid        = intersight_iam_end_point_user_policy.user_policy1.moid
    object_type = intersight_iam_end_point_user_policy.user_policy1.object_type
  }
  password = "Ch@ng3Me"
}

resource "intersight_iam_end_point_user" "iam_end_point_user1" {
  name = "${var.policy_prefix}-user"
  organization {
    object_type = "organization.Organization"
    moid        = var.organization
  }
}

# get the IMC role named admin
data "intersight_iam_end_point_role" "admin_role" {
  name = "admin"
  type = "IMC"
}

# =============================================================================
# Groups (map built-in roles to AD groups)
# -----------------------------------------------------------------------------

# Mapping of LDAP Group to EndPointRoles
resource "intersight_iam_ldap_group" "group1" {
  domain = "auslab.cisco.com"
  name   = "super_admin"
  end_point_role {
    moid = data.intersight_iam_end_point_role.imc_admin.results[0].moid
  }
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
}
resource "intersight_iam_ldap_group" "group2" {
  domain = "auslab.cisco.com"
  name   = "WWDC Lab Users"
  end_point_role {
    moid = data.intersight_iam_end_point_role.imc_user.results[0].moid
  }
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
}
resource "intersight_iam_ldap_group" "group3" {
  domain = "auslab.cisco.com"
  name   = "Domain Users"
  end_point_role {
    moid = data.intersight_iam_end_point_role.imc_readonly.results[0].moid
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
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
  port   = 389
  server = "172.16.1.90"
}

resource "intersight_iam_ldap_provider" "provider2" {
  ldap_policy {
    moid = intersight_iam_ldap_policy.policy1.moid
  }
  port   = 389
  server = "172.16.1.91"
}

# =============================================================================
# LDAP Policy
# -----------------------------------------------------------------------------

resource "intersight_iam_ldap_policy" "policy1" {
  base_properties {
    attribute                  = "CiscoAvPair"
    base_dn                    = "dc=auslab,dc=cisco,dc=com"
    bind_method                = "LoginCredentials"
    domain                     = "auslab.cisco.com"
    enable_encryption          = false
    enable_group_authorization = true
    filter                     = "samAccountName"
    group_attribute            = "memberOf"
    is_password_set            = false
    nested_group_search_depth  = 128
    timeout                    = 30
  }
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
