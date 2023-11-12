resource "yandex_container_registry" "this" {
  name      = "registry"
  folder_id = yandex_resourcemanager_folder.this.id

  labels = local.labels
}
