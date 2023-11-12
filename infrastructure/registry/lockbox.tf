resource "yandex_lockbox_secret" "gha" {
  name      = "github-actions"
  folder_id = yandex_resourcemanager_folder.this.id
}

resource "yandex_lockbox_secret_version" "gha" {
  secret_id = yandex_lockbox_secret.gha.id
  entries {
    key        = "ACCESS_KEY"
    text_value = yandex_iam_service_account_static_access_key.gha.access_key
  }
  entries {
    key        = "SECRET_KEY"
    text_value = yandex_iam_service_account_static_access_key.gha.secret_key
  }
}
