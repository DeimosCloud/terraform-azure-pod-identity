variable "resource_group_name" {
  description = "The name of the resource group where the SQL server resides"
  type        = string
}

variable "namespace" {
  description = "The namespace to deploy the external DNS kubernetes object"
  default     = "default"
}


variable "identity_name" {
  description = "The name of the identity to be used to identify pods"
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "azure_client_id" {
  description = "The App ID for your Service Principal/Managed Identity"
  type        = string
}

variable "azure_client_secret" {
  description = "The password/secret for your Service Principal/Managed Identity"
}

variable "tags" {
  default     = {}
  description = "tags to be passed to created pods"
}

variable "module_depends_on" {
  description = "Resources that the module depends on, AKS, namespace creation etc"
  default     = null
}
