terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  backend "s3" {
    endpoint    = "storage.yandexcloud.net"
    bucket      = "bucket-momo-store"
    region      = "ru-central1"
    key         = "k8s-cluster.tf"
    skip_region_validation      = true
    skip_credentials_validation = true
    access_key = "YCAJEa1BDQ3w-DpHF9Nd7uK0x"
    secret_key = "YCM4-tT3VxzHQ0NmMFVL0xPlkPVbpY3pngJxXLmf"
  }
}

provider "yandex" {
  cloud_id  = "b1gap14jhae4gb62dvga"
  folder_id = "b1gbmmr5iqp5f2n12m4e"
  zone      = "ru-central1-a"
}