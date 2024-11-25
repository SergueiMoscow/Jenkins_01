###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "subnet_id" {
  type    = string
}

variable "vms_ssh_user" {
  type    = string
  default = "jenkins"
}

variable "image_id" {
  type = string
  # default = "fd8evjqft4469vduenec" # CentOS 7
  default = "fd8gdrfaftkcaarp40fe" # CentOS 9
  # default = "fd8m28fo3npjgn17l5jt" # almalinux 9
}

variable "preemptible" {
  type = bool
  default = true
}