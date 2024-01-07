resource "random_password" "this" {
  count = var.user_password != null ? 0 : 1

  length      = 16
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  min_upper   = 1
  special     = true
}

resource "scaleway_documentdb_instance" "main" {
  engine            = var.engine
  is_ha_cluster     = var.ha_enabled
  name              = var.name
  node_type         = var.node_type
  telemetry_enabled = var.telemetry_enabled

  volume_size_in_gb = var.volume_size_in_gb
  volume_type       = var.volume_type

  user_name = var.user_name
  password  = var.user_password != null ? var.user_password : random_password.this[0].result

  region     = var.region
  project_id = var.project_id
  tags       = var.tags
}

resource "scaleway_documentdb_database" "additional" {
  for_each = toset(var.additional_databases)

  instance_id = scaleway_documentdb_instance.main.id
  name        = each.key
  region      = var.region
}
