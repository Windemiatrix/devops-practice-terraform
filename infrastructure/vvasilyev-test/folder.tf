resource "yandex_resourcemanager_folder" "this" {
  cloud_id    = local.cloud_id
  name        = "vvasilyev-test"
  description = "My first faking test"

  labels = local.labels
}
