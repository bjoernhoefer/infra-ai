---
name: validate-request
description: Validate an infrastructure request against the constitution, the module catalog and policies. Use when processing a new infrastructure request issue.
---

# Validate an infrastructure request

1. Extract: environment, owner, cost center, request ID, requested resources, network requirements.
2. If required information is missing, ask for it in a comment and stop.
3. Map each requested resource to an entry in `catalog/modules.json`. List missing modules explicitly.
4. Check the request against `constitution/constitution.md`. Report security risks.
5. Produce a structured summary: `compliant`, `missing_information`, `missing_modules`, `risks`.
