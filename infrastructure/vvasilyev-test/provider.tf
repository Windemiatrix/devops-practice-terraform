terraform {
  required_version = ">= 1.4.4"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.102.0"
    }
  }
}

#provider "yandex" {}
provider "yandex" {
  zone = "ru-central1-a"
}
