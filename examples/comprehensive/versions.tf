terraform {
  required_version = ">=0.15.4"

  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.8"
    }
  }
}