package policy.nodel

test_deletion_denied {
	deny with input as {"resource_changes": [{"address": "null_resource.test", "mode": "managed", "type": "null_resource", "name": "test", "provider_name": "registry.terraform.io/hashicorp/null", "change": {"actions": ["no-op"]}}, {"address": "null_resource.test-1", "mode": "managed", "type": "null_resource", "name": "test-1", "provider_name": "registry.terraform.io/hashicorp/null", "change": {"actions": ["delete"]}}]}
}

test_allow_no_changes {
	count(deny) == 0 with input as {"resource_changes": [{"address": "null_resource.test", "mode": "managed", "type": "null_resource", "name": "test", "provider_name": "registry.terraform.io/hashicorp/null", "change": {"actions": ["no-op"]}}]}
}
