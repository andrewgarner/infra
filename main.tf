provider "aws" {
  region = var.aws_region
}

import {
  to = aws_organizations_organization.root
  id = "o-jsxmqn3coi"
}

resource "aws_organizations_organization" "root" {
  aws_service_access_principals = ["sso.amazonaws.com"]
}

import {
  to = aws_organizations_organizational_unit.scratch
  id = "ou-wnve-948lv2iq"
}

resource "aws_organizations_organizational_unit" "scratch" {
  name      = "Scratch"
  parent_id = aws_organizations_organization.root.roots.0.id
}

data "aws_ssoadmin_instances" "this" {}

locals {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
}

import {
  to = aws_identitystore_user.andrew_garner
  id = "${local.identity_store_id}/06f202a4-c0f1-7046-8315-f708dc2418d3"
}

resource "aws_identitystore_user" "andrew_garner" {
  identity_store_id = local.identity_store_id

  display_name = "Andrew Garner"
  user_name    = "andrewgarner"
  locale       = "en-GB"
  profile_url  = "https://www.andrewgarner.com"
  timezone     = "Europe/London"

  name {
    family_name = "Garner"
    given_name  = "Andrew"
  }

  emails {
    primary = true
    value   = "andrew@andrewgarner.com"
  }
}
