# Remote State Locking Azure
A terraform module to automate creation and configuration of backend using azure blob


## Basic Usage

```hcl

#-----------------------------------------------
# Pod Identity
#-----------------------------------------------
module "pod_identity" {
  source = "."

  namespace           = var.internal_system_namespace
  azure_tenant_id     = var.azure_tenant_id
  azure_client_secret = var.azure_client_secret
  azure_client_id     = var.azure_client_id
  identity_name       = var.identity_name
  resource_group_name = module.resource_group.name

  module_depends_on = [null_resource.update_kubeconfig]
  tags              = local.common_tags
}
```

## Doc generation

Code formatting and documentation for variables and outputs is generated using [pre-commit-terraform hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses [terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install) to install pre-commit locally.

And install `terraform-docs` with
```bash
go get github.com/segmentio/terraform-docs
```
or
```bash
brew install terraform-docs.
```

## Contributing

Report issues/questions/feature requests on in the issues section.

Full contributing guidelines are covered [here](CONTRIBUTING.md).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 1.0 |
| helm | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 1.0 |
| helm | >= 1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azure\_client\_id | The App ID for your Service Principal/Managed Identity | `string` | n/a | yes |
| azure\_client\_secret | The password/secret for your Service Principal/Managed Identity | `any` | n/a | yes |
| azure\_tenant\_id | Azure Tenant ID | `string` | n/a | yes |
| identity\_name | The name of the identity to be used to identify pods | `any` | n/a | yes |
| module\_depends\_on | Resources that the module depends on, AKS, namespace creation etc | `any` | `null` | no |
| namespace | The namespace to deploy the external DNS kubernetes object | `string` | `"default"` | no |
| resource\_group\_name | The name of the resource group where the SQL server resides | `string` | n/a | yes |
| tags | tags to be passed to created pods | `map` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
