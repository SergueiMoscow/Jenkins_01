output "vm_list" {
  value = [for instance in yandex_compute_instance.server : {
    name = instance.name
    id   = instance.id
    fqdn = instance.fqdn
    ip   = instance.network_interface[0].nat_ip_address
  }]
}
