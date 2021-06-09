# Create Intersight Policies Module

This module simplifies the creation of basic server and domain policies in the specified Intersight organization. It takes a few inputs and creates more than 20 policies with common settings. It also creates a server profile template and UCS domain profile that use several of those policies. Objects are created with a consistent naming scheme and any tags specified.

This module is intended to give users a jump-start into creating their own policies but will not represent the exact policy that every user will want. The policies can be updated manually or just used a reference to create new policies.

See [examples](./examples/) for more details.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_access_policy.access1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/access_policy) | resource |
| [intersight_boot_precision_policy.boot_precision1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/boot_precision_policy) | resource |
| [intersight_deviceconnector_policy.dc1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/deviceconnector_policy) | resource |
| [intersight_fabric_eth_network_control_policy.fabric_eth_network_control_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_control_policy) | resource |
| [intersight_fabric_eth_network_group_policy.fabric_eth_network_group_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_group_policy) | resource |
| [intersight_fabric_eth_network_policy.fabric_eth_network_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_policy) | resource |
| [intersight_fabric_multicast_policy.fabric_multicast_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_multicast_policy) | resource |
| [intersight_fabric_port_mode.fabric_port_mode1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_port_mode) | resource |
| [intersight_fabric_port_policy.fabric_port_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_port_policy) | resource |
| [intersight_fabric_server_role.fabric_server_role1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_server_role) | resource |
| [intersight_fabric_switch_cluster_profile.fabric_switch_cluster_profile1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_cluster_profile) | resource |
| [intersight_fabric_switch_profile.fabric_switch_profile_a](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_profile) | resource |
| [intersight_fabric_switch_profile.fabric_switch_profile_b](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_profile) | resource |
| [intersight_fabric_system_qos_policy.qos1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_system_qos_policy) | resource |
| [intersight_fabric_uplink_pc_role.fabric_uplink_pc_role1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_uplink_pc_role) | resource |
| [intersight_fabric_vlan.fabric_vlan1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_vlan) | resource |
| [intersight_iam_end_point_user.iam_end_point_user1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user) | resource |
| [intersight_iam_end_point_user_policy.user_policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_policy) | resource |
| [intersight_iam_end_point_user_role.roleadmin](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_role) | resource |
| [intersight_iam_ldap_group.group1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_group.group2](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_group.group3](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_group) | resource |
| [intersight_iam_ldap_policy.policy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_policy) | resource |
| [intersight_iam_ldap_provider.provider1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_provider) | resource |
| [intersight_iam_ldap_provider.provider2](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_ldap_provider) | resource |
| [intersight_ipmioverlan_policy.ipmi2](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ipmioverlan_policy) | resource |
| [intersight_kvm_policy.kvmpolicy1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kvm_policy) | resource |
| [intersight_networkconfig_policy.connectivity1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/networkconfig_policy) | resource |
| [intersight_ntp_policy.ntp1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ntp_policy) | resource |
| [intersight_sdcard_policy.sdcard1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/sdcard_policy) | resource |
| [intersight_server_profile_template.template1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/server_profile_template) | resource |
| [intersight_sol_policy.sol1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/sol_policy) | resource |
| [intersight_storage_disk_group_policy.group1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/storage_disk_group_policy) | resource |
| [intersight_storage_storage_policy.storage1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/storage_storage_policy) | resource |
| [intersight_vmedia_policy.vmedia1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vmedia_policy) | resource |
| [intersight_vmedia_policy.vmedia2](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vmedia_policy) | resource |
| [intersight_vnic_eth_adapter_policy.v_eth_adapter1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_adapter_policy) | resource |
| [intersight_vnic_eth_if.eth0](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_if) | resource |
| [intersight_vnic_eth_if.eth1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_if) | resource |
| [intersight_vnic_eth_qos_policy.v_eth_qos1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_qos_policy) | resource |
| [intersight_vnic_lan_connectivity_policy.vnic_lan1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_lan_connectivity_policy) | resource |
| [intersight_iam_end_point_role.admin_role](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |
| [intersight_iam_end_point_role.imc_admin](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |
| [intersight_iam_end_point_role.imc_readonly](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |
| [intersight_iam_end_point_role.imc_user](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | description field for all policies | `string` | `"Created by Terraform. Do not edit manually."` | no |
| <a name="input_dns_alternate"></a> [dns\_alternate](#input\_dns\_alternate) | IP address of secondary (alternate) DNS server | `string` | `""` | no |
| <a name="input_dns_preferred"></a> [dns\_preferred](#input\_dns\_preferred) | IP address of primary (preferred) DNS server | `string` | n/a | yes |
| <a name="input_fc_port_count_6454"></a> [fc\_port\_count\_6454](#input\_fc\_port\_count\_6454) | number of ports to assign to FC starting at port 1 | `number` | `0` | no |
| <a name="input_imc_access_pool"></a> [imc\_access\_pool](#input\_imc\_access\_pool) | moid of IP pool for IMC access | `string` | n/a | yes |
| <a name="input_imc_access_vlan"></a> [imc\_access\_vlan](#input\_imc\_access\_vlan) | ID of VLAN for IMC access | `number` | n/a | yes |
| <a name="input_imc_admin_password"></a> [imc\_admin\_password](#input\_imc\_admin\_password) | password for the local user policy for IMC | `string` | `"Cha@ng3Me"` | no |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | list of NTP servers | `list(string)` | n/a | yes |
| <a name="input_ntp_timezone"></a> [ntp\_timezone](#input\_ntp\_timezone) | valid timezone as documented at https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ntp_policy | `string` | `"America/Chicago"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | moid for organization in which to create the policies | `string` | n/a | yes |
| <a name="input_policy_prefix"></a> [policy\_prefix](#input\_policy\_prefix) | prefix for all policies created | `string` | `"terraform-standard"` | no |
| <a name="input_port_channel_6454"></a> [port\_channel\_6454](#input\_port\_channel\_6454) | list of port numbers to be assigned to uplink port channel | `set(string)` | n/a | yes |
| <a name="input_server_ports_6454"></a> [server\_ports\_6454](#input\_server\_ports\_6454) | list of port numbers to be assigned to server ports | `set(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | user tags to be applied to all policies | `list(map(string))` | `[]` | no |
| <a name="input_uplink_vlans_6454"></a> [uplink\_vlans\_6454](#input\_uplink\_vlans\_6454) | map of vlan names and IDs to be used on FI uplinks | `map(number)` | n/a | yes |
| <a name="input_vnic_mac_pool"></a> [vnic\_mac\_pool](#input\_vnic\_mac\_pool) | moid of MAC pool for use with vnics | `string` | n/a | yes |
| <a name="input_vnic_native_vlan"></a> [vnic\_native\_vlan](#input\_vnic\_native\_vlan) | native VLAN for vnic profiles | `number` | `1` | no |

## Outputs

No outputs.
