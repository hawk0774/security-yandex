############
# Provider #
############
variable "cloud_id" {
  type        = string
  default     = ""
}

variable "folder_id" {
  type        = string
  default     = ""
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
}

#########################
# Object Storage bucket #
#########################

variable "bucket_name" {
  type        = string
  default     = "yastrebov-09-03-2026"
}

variable "image_path" {
  type        = string
  default     = "./goyda.jpg"
}

variable "image_object_key" {
  type        = string
  description = "Object key (file name) in the bucket"
  default     = "goyda.jpg"
}
