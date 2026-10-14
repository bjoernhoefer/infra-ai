# infra-ai

AI-assisted framework for deploying Azure infrastructure across multiple repositories.

This repository is the **single source of truth** for platform knowledge. It is consumed by:

- **Spec Kit** (development lane) – building and evolving Terraform modules and the framework itself.
- **GitHub Agentic Workflows (gh-aw)** (operations lane) – processing infrastructure requests (e.g. from ServiceNow) at runtime.

## Architecture

```
ServiceNow request ──► GitHub issue (orchestration) ──► gh-aw agent
                                                          ├─ module exists  → PR in config repo → CI (plan, policy) → approval → apply
                                                          └─ module missing → issue in new module repo → Spec Kit lane → release → catalog update
```

## Repository landscape

| Repository type | Purpose |
|---|---|
| `infra-ai` (this repo) | Constitution, skills, module catalog, policies, shared workflow components |
| `infra-config-<env>` | Environment-specific configuration (dev / test / prod) |
| `terraform-azurerm-<resource>` | One Terraform module per resource, based on Azure Verified Modules (AVM) |
| `infra-bootstrap` | Minimal bootstrap (state storage, OIDC identities, base roles) – human-controlled only |
| `infra-orchestration` | Request intake and gh-aw workflows |

## Layout

| Path | Content |
|---|---|
| `constitution/` | Platform principles shared by all repositories |
| `skills/` | Agent Skills (`SKILL.md`) usable by Copilot, gh-aw and Spec Kit agents |
| `catalog/` | Machine-readable module catalog and its JSON schema |
| `policies/` | Policy as code enforcing the constitution deterministically |
| `.github/workflows/shared/` | Importable gh-aw components |
| `.github/agents/` | Custom agent definitions |
| `docs/` | Design documentation |

## Principles

1. Knowledge is maintained in **one place** only – here.
2. AI proposes, **deterministic checks and humans decide**.
3. Agents are read-only; writes happen only via safe outputs and pull requests.
4. All documentation and code are written in **English**.
