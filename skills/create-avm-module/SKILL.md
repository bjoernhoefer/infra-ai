---
name: create-avm-module
description: Create a new Terraform module for a single Azure resource based on Azure Verified Modules. Use when a requested resource type has no entry in the module catalog.
---

# Create an AVM-based module

1. Read `constitution/constitution.md` and follow all principles.
2. Check the AVM index (https://azure.github.io/Azure-Verified-Modules/) for an existing module for the resource type.
3. Create the repository `terraform-azurerm-<resource>` from the module template.
4. Wrap the AVM module and expose only inputs required by the platform; enforce secure defaults.
5. Add `examples/`, tests (`terraform test`), and a `catalog-entry.json` that validates against `catalog/module.schema.json`.
6. Open a pull request and an issue for review. Never release without human approval.
