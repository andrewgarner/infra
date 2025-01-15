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
