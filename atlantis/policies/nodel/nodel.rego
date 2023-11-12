package policy.nodel

resources_to_delete = resources {
	resources := [res.address | res := input.resource_changes[_]; res.change.actions[_] == "delete"]
}

deny[msg] {
	resources := resources_to_delete
	count(resources) > 0

	msg := sprintf("nothing should be deleted. deleted: %v", [resources])
}
