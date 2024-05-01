terraform {
  required_version = "~> 1"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
    scaleway = {
      source  = "scaleway/scaleway"
      version = ">= 2.29.0"
    }
  }
}
