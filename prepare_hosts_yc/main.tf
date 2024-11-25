resource "yandex_compute_instance" "server" {
  for_each = { for vm in local.vms : vm.vm_name => vm }

  name = each.value.vm_name
  hostname = each.value.vm_name
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
        image_id = each.value.image_id
    }
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = local.vm_metadata

}


resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      master_ip = yandex_compute_instance.server["master"].network_interface[0].nat_ip_address,
      agent_ip  = yandex_compute_instance.server["agent"].network_interface[0].nat_ip_address,
      ansible_user = var.vms_ssh_user
    }
  )

  filename = local.hosts_filename
}


locals {
  vms = [
    {
      vm_name       = "master"
      cpu           = 2
      ram           = 4
      core_fraction = 20
      disk_volume   = 20
      image_id      = var.image_id
    },
    {
      vm_name       = "agent"
      cpu           = 2
      ram           = 4
      core_fraction = 20
      disk_volume   = 20
      image_id      = var.image_id
    }
  ]

  hosts_filename = "${abspath(path.module)}/../infrastructure/inventory/cicd/hosts.yml"

  vm_metadata = {
    user-data = "${file("${abspath(path.module)}/cloud-init.yml")}"
    serial-port-enable = 1
    ssh-keys           = "${var.vms_ssh_user}:${file("~/.ssh/id_ed25519.pub")}"
  }
  # vm_metadata = {
  #   serial-port-enable = 1
  #   ssh-keys           = "${var.vms_ssh_user}:${file("~/.ssh/id_ed25519.pub")}"
  # }
}

