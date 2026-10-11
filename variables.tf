variable "schema_registry_deks" {
  description = <<EOT
Map of schema_registry_deks, attributes below
Required:
    - kek_name
    - subject_name
Optional:
    - algorithm
    - encrypted_key_material
    - hard_delete
    - rest_endpoint
    - version
    - credentials (block):
        - key (required)
        - secret (required)
    - schema_registry_cluster (block):
        - id (required)
EOT

  type = map(object({
    kek_name               = string
    subject_name           = string
    algorithm              = optional(string)
    encrypted_key_material = optional(string)
    hard_delete            = optional(bool)
    rest_endpoint          = optional(string)
    version                = optional(number)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    schema_registry_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

