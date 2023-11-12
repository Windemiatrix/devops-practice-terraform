package policy.location

test_denied_wrong_location {
	deny with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "location": "unknown_location", "name": "test"}}}]}
}

test_allow_allowed_location {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "location": "westeurope", "name": "test"}}}]}
}

test_allow_without_location {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_vnet_rule.test", "mode": "managed", "type": "azurerm_vnet_rule", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "name": "test"}}}]}
}

test_allow_update {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["update"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "location": "unknown_location", "name": "test"}}}]}
}

test_allow_delete {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["delete"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "location": "unknown_location", "name": "test"}}}]}
}

test_denied_wrong_location_on_recreation {
	deny with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["delete", "create"], "after": {"id": "/subscriptions/00000000-0000-0000-0000-0000000000/resourceGroups/test", "location": "unknown_location", "name": "test"}}}]}
}

test_allow_another_provider {
	count(deny) == 0 with input as {"resource_changes": [{"address": "provider_check.test", "mode": "managed", "type": "provider_check", "name": "test", "provider_name": "registry.terraform.io/provider_check", "change": {"actions": ["create"], "after": {"location": "unknown_location", "name": "test"}}}]}
}
