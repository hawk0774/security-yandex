resource "yandex_storage_bucket" "img" {
  bucket        = var.bucket_name
  force_destroy = true

  anonymous_access_flags {
    read        = true
    list        = false
    config_read = false
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "pic" {
  bucket       = yandex_storage_bucket.img.bucket
  key          = var.image_object_key
  source       = var.image_path
  content_type = "image/jpeg"
}

locals {
  public_image_url = "https://storage.yandexcloud.net/${yandex_storage_bucket.img.bucket}/${yandex_storage_object.pic.key}"
}

