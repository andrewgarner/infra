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
