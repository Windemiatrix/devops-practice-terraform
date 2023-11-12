package main

deny[msg] {
	denies := {m | m := data.policy[_].deny[_]}
	count(denies) > 0
	msg := sprintf("%d policies failed\n%s", [
		count(denies),
		concat("\n", [sprintf("- %s", [m]) | denies[m]]),
	])
}
