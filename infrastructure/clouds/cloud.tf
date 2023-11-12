resource "yandex_resourcemanager_cloud" "this" {
  for_each = { for name in local.clouds : name => name }

  organization_id = local.organization_id
  name            = each.value

  labels = local.labels
}
