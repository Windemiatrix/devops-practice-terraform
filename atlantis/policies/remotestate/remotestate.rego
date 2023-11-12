package policy.remotestate

remote_state_data = resources {
	resources := [res.address |
		res := input.configuration.root_module.resources[_]
		res.mode == "data"
		res.type == "terraform_remote_state"
	]
}

deny[msg] {
	remote_states := remote_state_data
	count(remote_states) > 0

	msg := sprintf("no data.terraform_remote_state should be used. used in: %v", [remote_states])
}
