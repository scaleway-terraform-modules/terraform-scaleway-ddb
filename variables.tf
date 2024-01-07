## Instance topology
variable "engine" {
  description = "Database Instance's engine version. Updates to engine will recreate the Database Instance."
  type        = string
  default     = "FerretDB-1"
}

variable "ha_enabled" {
  description = "Enable or disable high availability for the database instance."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the Database Instance."
  type        = string
}

variable "node_type" {
  description = "Type of database instance you want to create. Updates to node_type will upgrade the Database Instance to the desired node_type without any interruption. Keep in mind that you cannot downgrade a Database Instance."
  type        = string
}

variable "telemetry_enabled" {
  description = "Enable telemetry to collects basic anonymous usage data and sends them to FerretDB telemetry service. More about the telemetry [here](https://docs.ferretdb.io/telemetry/#configure-telemetry)."
  type        = bool
  default     = false
}

## Databases
variable "additional_databases" {
  description = "List of names of additional databases."
  type        = list(string)
  default     = []
}

## Storage
variable "volume_type" {
  description = "Type of volume where data are stored (`bssd` or `lssd`)."
  type        = string
  default     = "lssd"

  validation {
    condition     = contains(["bssd", "lssd"], var.volume_type)
    error_message = "Volumes can only be one of 'bssd' or 'lssd'."
  }
}

variable "volume_size_in_gb" {
  description = "Volume size (in GB) when volume_type is set to `bssd`."
  type        = number
  default     = null
}

## User informations
variable "user_name" {
  description = "Identifier for the first user of the database instance. **Warning** Changing the user_name will recreate the Database Instance."
  type        = string

  validation {
    condition     = can(regex("^[-_a-zA-Z0-9]{1,63}$", var.user_name))
    error_message = "Username can contain up to 63 characters and must start with a letter. Only alphanumeric characters, underscores, and dashes are accepted."
  }
}

variable "user_password" {
  description = "Password for the first user of the database instance. A random password will be generated if `null`."
  sensitive   = true
  type        = string
  default     = null
}

## Scaleway tenancy
variable "project_id" {
  description = "ID of the project the instance is associated with. Ressource will be created in the project set at the provider level if `null`."
  type        = string
  default     = null
}

variable "region" {
  description = "Region in which the instance should be created. Ressource will be created in the region set at the provider level if `null`."
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags associated with the server and dedicated ip address."
  default     = []
}
