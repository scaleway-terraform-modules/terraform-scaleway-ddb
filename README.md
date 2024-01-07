# Terraform / Scaleway

## Purpose

This repository is used to manage Document DB instances on scaleway using terraform.

## Usage

- Setup the [scaleway provider](https://www.terraform.io/docs/providers/scaleway/index.html) in your tf file.
- Include this module in your tf file. Refer to [documentation](https://www.terraform.io/docs/modules/sources.html#generic-git-repository).

```hcl
module "my_cluster" {
  source  = "scaleway-terraform-modules/ddb/scaleway"
  version = "0.0.1"

  # insert required variables here
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.4.3 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement_scaleway) | >= 2.29.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [scaleway_documentdb_database.additional](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/documentdb_database) | resource |
| [scaleway_documentdb_instance.main](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/documentdb_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input_name) | Name of the Database Instance. | `string` | n/a | yes |
| <a name="input_node_type"></a> [node_type](#input_node_type) | Type of database instance you want to create. Updates to node_type will upgrade the Database Instance to the desired node_type without any interruption. Keep in mind that you cannot downgrade a Database Instance. | `string` | n/a | yes |
| <a name="input_user_name"></a> [user_name](#input_user_name) | Identifier for the first user of the database instance. **Warning** Changing the user_name will recreate the Database Instance. | `string` | n/a | yes |
| <a name="input_additional_databases"></a> [additional_databases](#input_additional_databases) | List of names of additional databases. | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input_engine) | Database Instance's engine version. Updates to engine will recreate the Database Instance. | `string` | `"FerretDB-1"` | no |
| <a name="input_ha_enabled"></a> [ha_enabled](#input_ha_enabled) | Enable or disable high availability for the database instance. | `bool` | `false` | no |
| <a name="input_project_id"></a> [project_id](#input_project_id) | ID of the project the instance is associated with. Ressource will be created in the project set at the provider level if `null`. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input_region) | Region in which the instance should be created. Ressource will be created in the region set at the provider level if `null`. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input_tags) | Tags associated with the server and dedicated ip address. | `list(string)` | `[]` | no |
| <a name="input_telemetry_enabled"></a> [telemetry_enabled](#input_telemetry_enabled) | Enable telemetry to collects basic anonymous usage data and sends them to FerretDB telemetry service. More about the telemetry [here](https://docs.ferretdb.io/telemetry/#configure-telemetry). | `bool` | `false` | no |
| <a name="input_user_password"></a> [user_password](#input_user_password) | Password for the first user of the database instance. A random password will be generated if `null`. | `string` | `null` | no |
| <a name="input_volume_size_in_gb"></a> [volume_size_in_gb](#input_volume_size_in_gb) | Volume size (in GB) when volume_type is set to `bssd`. | `number` | `null` | no |
| <a name="input_volume_type"></a> [volume_type](#input_volume_type) | Type of volume where data are stored (`bssd` or `lssd`). | `string` | `"lssd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance_id](#output_instance_id) | ID of the Database Instance. |
| <a name="output_user_password"></a> [user_password](#output_user_password) | Password generated if none were given. |
<!-- END_TF_DOCS -->

## Authors

Module is maintained with help from [the community](https://github.com/scaleway-terraform-modules/terraform-scaleway-domain/graphs/contributors).

## License

Mozilla Public License 2.0 Licensed. See [LICENSE](https://github.com/scaleway-terraform-modules/terraform-scaleway-domain/tree/master/LICENSE) for full details.
