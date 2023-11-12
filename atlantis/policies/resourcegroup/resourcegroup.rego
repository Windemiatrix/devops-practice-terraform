package policy.resourcegroup

postfix = "-rg"

rgs_to_create = rgs {
	rgs := [name |
		res := input.resource_changes[_]
		res.change.actions[_] == "create"
		res.mode == "managed"
		res.type == "azurerm_resource_group"
		name := res.change.after.name
	]
}

does_rg_have_right_postfix(rg) {
	endswith(rg, postfix)
}

rgs_with_wrong_postfix(rgs) = wrong_rgs {
	wrong_rgs := [rg |
		rg := rgs[_]
		not does_rg_have_right_postfix(rg)
	]
}

deny[msg] {
	rgs := rgs_to_create
	wrong_rgs := rgs_with_wrong_postfix(rgs)
	count(wrong_rgs) > 0

	msg := sprintf("resource group name should end with `-rg` postfix. wrong rg being create: %v", [rgs])
}
