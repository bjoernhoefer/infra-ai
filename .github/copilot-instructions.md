# Copilot instructions for infra-ai

This repository is the single source of truth for the infra-ai platform: constitution, agent skills, module catalog, policies and shared gh-aw workflow components.

## Mandatory rules

- **Write everything in English**: documentation, code, comments, commit messages, pull request titles/descriptions and issue texts. This applies even if the task prompt is written in another language.
- Read and follow [`constitution/constitution.md`](../constitution/constitution.md) before making changes. If a request conflicts with the constitution, stop and explain the conflict instead of implementing it.
- Never add secrets, credentials, subscription IDs or tenant IDs to the repository.
- Keep knowledge in one place: update existing files instead of duplicating content.

## Repository layout

| Path | Purpose |
|---|---|
| `constitution/` | Platform principles shared by all repositories |
| `skills/<name>/SKILL.md` | Agent Skills (YAML frontmatter with `name` and `description`, followed by instructions) |
| `catalog/` | `module.schema.json` and `modules.json` (machine-readable module catalog) |
| `policies/opa/` | Rego policies (use `import rego.v1`) |
| `.github/workflows/shared/` | Importable gh-aw components (no `on:` trigger) |
| `.github/agents/` | Custom agent definitions (`*.agent.md`) |
| `docs/` | Design documentation |

## Validation

Run the checks relevant to your change before finishing:

- Rego policies: `opa fmt --diff policies/` and `opa check policies/`
- Catalog: `check-jsonschema --schemafile catalog/module.schema.json <entry>.json` for catalog entries
- Terraform (if present): `terraform fmt -check -recursive` and `terraform validate`
- gh-aw workflows: `gh aw compile` (commit the generated `.lock.yml` files)

## Conventions

- Terraform modules follow Azure Verified Modules (AVM) and are named `terraform-azurerm-<resource>`.
- Every Azure resource must carry the tags `environment`, `owner`, `cost-center`, `request-id`.
- Use Conventional Commits for commit messages (e.g. `feat(catalog): add storage account module`).
