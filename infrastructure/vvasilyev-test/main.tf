resource "yandex_compute_instance" "vm" {
  name = "terraform1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8tir33idvbn40d00nm"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  #  metadata = {
  #    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  #  }
}

resource "yandex_vpc_network" "network" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_vm" {
  value = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address_vm" {
  value = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
