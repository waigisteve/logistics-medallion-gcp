variable "name_prefix" {
  type = string
}

variable "region" {
  type = string
}

resource "google_kms_key_ring" "platform" {
  name     = "${var.name_prefix}-kr"
  location = var.region
}

resource "google_kms_crypto_key" "platform" {
  name            = "${var.name_prefix}-key"
  key_ring        = google_kms_key_ring.platform.id
  rotation_period = "7776000s"
}
