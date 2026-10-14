package infra.tags

import rego.v1

required_tags := {"environment", "owner", "cost-center", "request-id"}

deny contains msg if {
	some r in input.resource_changes
	r.change.after.tags != null
	missing := required_tags - object.keys(r.change.after.tags)
	count(missing) > 0
	msg := sprintf("%s is missing required tags: %v", [r.address, missing])
}
