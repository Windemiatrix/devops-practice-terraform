resource "yandex_lockbox_secret" "gha" {
  name      = "github-actions"
  folder_id = yandex_resourcemanager_folder.this.id
}

resource "yandex_lockbox_secret_version" "gha" {
  secret_id = yandex_lockbox_secret.gha.id
  entries {
    key        = "YA_CR_USERNAME"
    text_value = "json_key"
  }
  entries {
    key = "YA_CR_PASSWORD"
    text_value = jsonencode({
      id : yandex_iam_service_account_key.gha.id,
      service_account_id : yandex_iam_service_account.gha.id,
      created_at : yandex_iam_service_account_key.gha.created_at,
      key_algorithm : yandex_iam_service_account_key.gha.key_algorithm,
      public_key : yandex_iam_service_account_key.gha.public_key,
      private_key : yandex_iam_service_account_key.gha.private_key
    })
  }
  entries {
    key        = "DOCKER_REGISTRY"
    text_value = "cr.yandex"
  }
}
