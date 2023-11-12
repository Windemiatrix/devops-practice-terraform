package policy.resourcegroup

test_denied_wrong_rg_name {
	deny with input as {"resource_changes": [{"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "test", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}]}
}

test_allowed_right_rg_name {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_resource_group.test_rg", "mode": "managed", "type": "azurerm_resource_group", "name": "test_rg", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "test-rg", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}]}
}

test_denied_when_multiple_rgs {
	deny with input as {"resource_changes": [{"address": "azurerm_resource_group.test_rg", "mode": "managed", "type": "azurerm_resource_group", "name": "test_rg", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "test-rg", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}, {"address": "azurerm_resource_group.test", "mode": "managed", "type": "azurerm_resource_group", "name": "test", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "test", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}, {"address": "azurerm_resource_group.one_more_rg", "mode": "managed", "type": "azurerm_resource_group", "name": "one_more_rg", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "one-more-rg", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}]}
}

test_allowed_multiple_rgs {
	count(deny) == 0 with input as {"resource_changes": [{"address": "azurerm_resource_group.test_rg", "mode": "managed", "type": "azurerm_resource_group", "name": "test_rg", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "test-rg", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}, {"address": "azurerm_resource_group.one_more_rg", "mode": "managed", "type": "azurerm_resource_group", "name": "one_more_rg", "provider_name": "registry.terraform.io/hashicorp/azurerm", "change": {"actions": ["create"], "before": null, "after": {"location": "westeurope", "name": "one-more-rg", "tags": null, "timeouts": null}, "after_unknown": {"id": true}, "before_sensitive": false, "after_sensitive": {}}}]}
}
