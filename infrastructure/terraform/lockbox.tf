resource "yandex_lockbox_secret" "this" {
  name      = "terraform-storage-keys"
  folder_id = yandex_resourcemanager_folder.this.id
}

resource "yandex_lockbox_secret_version" "this" {
  secret_id = yandex_lockbox_secret.this.id
  entries {
    key        = "YC_STORAGE_ACCESS_KEY"
    text_value = yandex_iam_service_account_static_access_key.this.access_key
  }
  entries {
    key        = "YC_STORAGE_SECRET_KEY"
    text_value = yandex_iam_service_account_static_access_key.this.secret_key
  }
}
