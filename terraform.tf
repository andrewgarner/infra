terraform {
  required_version = ">= 1.10.4"

  cloud {
    organization = "andrewgarner"

    workspaces {
      name = "infra"
    }
  }
}
