variable "name_prefix" {
  type = string
}

variable "labels" {
  type = map(string)
}

resource "google_storage_bucket" "bronze" {
  name                        = "${var.name_prefix}-bronze"
  location                    = "US"
  force_destroy               = false
  uniform_bucket_level_access = true
  labels                      = var.labels
}

resource "google_storage_bucket" "silver" {
  name                        = "${var.name_prefix}-silver"
  location                    = "US"
  force_destroy               = false
  uniform_bucket_level_access = true
  labels                      = var.labels
}

resource "google_storage_bucket" "gold" {
  name                        = "${var.name_prefix}-gold"
  location                    = "US"
  force_destroy               = false
  uniform_bucket_level_access = true
  labels                      = var.labels
}
