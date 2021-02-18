data azurerm_resource_group "rg" {
  name = var.resource_group_name
}

# External DNS Deployment using Helm
resource "helm_release" "pod_identity" {
  name             = "pod-identity"
  repository       = path.module
  chart            = "pod-identity"
  namespace        = var.namespace
  create_namespace = true

  set {
    name  = "identityName"
    value = var.identity_name
  }

  set {
    name  = "resourceID"
    value = data.azurerm_resource_group.rg.name
  }

  set {
    name  = "clientSecret"
    value = base64encode(var.azure_client_secret)
  }

  set {
    name  = "clientID"
    value = var.azure_client_id
  }

  set {
    name  = "tenantID"
    value = var.azure_tenant_id
  }

  depends_on = [var.module_depends_on]
}
