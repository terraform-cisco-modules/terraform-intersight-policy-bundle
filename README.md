# Create Intersight Policies Module

This module creates several policies within an organization.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | 1.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_boot_precision_policy.boot_precision1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/boot_precision_policy) | resource |
| [intersight_deviceconnector_policy.dc1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/deviceconnector_policy) | resource |
| [intersight_iam_ldap_group.group1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_group.group2](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_group.group3](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_policy.policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_policy) | resource |
| [intersight_iam_ldap_provider.provider1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_provider) | resource |
| [intersight_iam_ldap_provider.provider2](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/iam_ldap_provider) | resource |
| [intersight_ipmioverlan_policy.ipmi2](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/ipmioverlan_policy) | resource |
| [intersight_kvm_policy.kvmpolicy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/kvm_policy) | resource |
| [intersight_networkconfig_policy.connectivity1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/networkconfig_policy) | resource |
| [intersight_ntp_policy.ntp1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/ntp_policy) | resource |
| [intersight_storage_disk_group_policy.group1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/storage_disk_group_policy) | resource |
| [intersight_storage_storage_policy.storage1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/storage_storage_policy) | resource |
| [intersight_vmedia_policy.vmedia1](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/resources/vmedia_policy) | resource |
| [intersight_iam_end_point_role.imc_admin](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/data-sources/iam_end_point_role) | data source |
| [intersight_iam_end_point_role.imc_readonly](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/data-sources/iam_end_point_role) | data source |
| [intersight_iam_end_point_role.imc_user](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.6/docs/data-sources/iam_end_point_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | description field for all policies | `string` | `"Created by Terraform. Do not edit manually."` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | moid for organization in which to create the policies | `string` | n/a | yes |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | prefix for all policies created | `string` | `"terraform-standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | user tags to be applied to all policies | `list(map(string))` | n/a | yes |

## Outputs

No outputs.
