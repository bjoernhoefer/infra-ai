# Platform Constitution

Version: 0.1.0

## Core principles

1. **Language** – All documentation, code, comments, commit messages and issues MUST be written in English.
2. **Security by default** – Deny by default for network access; private endpoints preferred; no public IPs unless explicitly approved.
3. **Azure Verified Modules first** – New Terraform modules MUST wrap or reuse AVM modules where available.
4. **One resource per module** – Each module represents exactly one Azure resource type.
5. **Least privilege** – Identities use OIDC federation and minimal RBAC roles. No long-lived secrets.
6. **Policy as code** – Every rule that can be enforced deterministically MUST also exist in `policies/`.
7. **Human approval** – No change reaches an environment without a reviewed pull request; production requires an additional approval.
8. **Traceability** – Every change references its originating request ID (e.g. ServiceNow RITM).
9. **Tagging** – All resources carry the tags `environment`, `owner`, `cost-center`, `request-id`.

## Bootstrap rules

- The bootstrap repository is changed by humans only. Agents MUST NOT open pull requests against it.

## Governance

Amendments to this constitution are made via pull request and require approval by the platform owners.
