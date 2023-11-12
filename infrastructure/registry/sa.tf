resource "yandex_iam_service_account" "gha" {
  folder_id   = yandex_resourcemanager_folder.this.id
  name        = "github-actions"
  description = "Service account that required to upload docker images to container registry with GitHub Actions"
}

resource "yandex_container_registry_iam_binding" "this" {
  registry_id = yandex_container_registry.this.id
  role        = "container-registry.images.pusher"
  members = [
    "serviceAccount:${yandex_iam_service_account.gha.id}",
  ]

  depends_on = [
    yandex_iam_service_account.gha
  ]
}

resource "yandex_iam_service_account_static_access_key" "gha" {
  service_account_id = yandex_iam_service_account.gha.id
  description        = "Static access key for service account"

  depends_on = [
    yandex_iam_service_account.gha
  ]
}

resource "yandex_iam_service_account_key" "gha" {
  service_account_id = yandex_iam_service_account.gha.id
  description        = "IAM key for pulling images automation by GitHub Actions"
  key_algorithm      = "RSA_4096"
}
