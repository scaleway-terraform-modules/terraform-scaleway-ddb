output "instance_id" {
  description = "ID of the Database Instance."
  value       = scaleway_documentdb_instance.main.id
}

output "user_password" {
  description = "Password generated if none were given."
  sensitive   = true
  value       = try(random_password.this[0].result, null)
}
