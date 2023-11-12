package policy.remotestate

test_denied_data_remote_state {
	deny with input as {"configuration": {"root_module": {"resources": [{"address": "data.terraform_remote_state.test", "mode": "data", "type": "terraform_remote_state", "name": "test", "provider_config_key": "terraform", "expressions": {"backend": {"constant_value": "azurerm"}, "config": {"constant_value": {"container_name": "tfstate"}}}, "schema_version": 0}]}}}
}

test_allowed_other_data_types {
	count(deny) == 0 with input as {"configuration": {"root_module": {"resources": [{"address": "data.azuread_user.test_user", "mode": "data", "type": "azuread_user", "name": "test_user", "provider_config_key": "azuread", "expressions": {"user_principal_name": {"constant_value": "test.user@dodopizza.com"}}, "schema_version": 0}]}}}
}
