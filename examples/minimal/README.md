# Create Policy

This example is a **minimal** set of inputs needed to use this module to create over 20 policies in an Intersight organization.

## Usage

To run this example you need to execute:

`main.tf`
```
provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "intersight_policy_bundle" {
  source = "terraform-cisco-modules/policy-bundle/intersight"

  # external sources
  organization    = data.intersight_organization_organization.myorg.id
  vnic_mac_pool   = var.mac_pool_moid
  imc_access_pool = var.ip_pool_moid

  # every policy created will have this prefix in its name
  policy_prefix = "my-first"

  # Fabric Interconnect 6454 config specifics
  server_ports_6454 = [17, 18, 19, 20]
  port_channel_6454 = [49, 50]
  uplink_vlans_6454 = {
    "vlan1020" : 1020,
    "vlan1021" : 1021
  }

  imc_access_vlan    = 1020
  imc_admin_password = "Inters!ght"

  ntp_servers = ["time-a-g.nist.gov"]

  dns_preferred = "172.16.1.98"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.15.4 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | >=1.0.8 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_intersight_policy"></a> [intersight\_policy](#module\_intersight\_policy) | ./modules/terraform-intersight-policy |  |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.myorg](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | API Key | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | API Endpoint URL | `string` | `"https://www.intersight.com"` | no |
| <a name="input_ip_pool_moid"></a> [ip\_pool\_moid](#input\_ip\_pool\_moid) | moid of IP pool for IMC use | `string` | n/a | yes |
| <a name="input_mac_pool_moid"></a> [mac\_pool\_moid](#input\_mac\_pool\_moid) | moid of MAC pool for VNIC use | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | target organization name | `string` | `"default"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Secret Key or file location | `string` | n/a | yes |

## Outputs

No outputs.
