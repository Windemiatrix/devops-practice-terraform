package policy.location

allowed_locations = ["westeurope"]

in_allowed_location(loc) {
	loc == allowed_locations[_]
}

resources_out_of_allowed_locations = resources {
	resources := [res.address |
		res := input.resource_changes[_]
		res.provider_name == "registry.terraform.io/hashicorp/azurerm"
		res.change.actions[_] == "create"
		not in_allowed_location(res.change.after.location)
	]
}

deny[msg] {
	resources := resources_out_of_allowed_locations
	count(resources) > 0

	msg := sprintf("all resources should be in %v locations. these resources are out of them: %v", [allowed_locations, resources])
}
