variable "name_prefix" {
  type = string
}

variable "project_id" {
  type = string
}

variable "location" {
  type = string
}

variable "labels" {
  type = map(string)
}

variable "dataset_ids" {
  type = list(string)
}

resource "google_bigquery_dataset" "curated" {
  for_each = toset(var.dataset_ids)

  project                    = var.project_id
  dataset_id                 = replace("${var.name_prefix}_${each.value}", "-", "_")
  location                   = var.location
  delete_contents_on_destroy = false

  labels = merge(var.labels, {
    layer = each.value
  })
}

resource "google_secret_manager_secret" "snowflake" {
  secret_id = "${var.name_prefix}-snowflake"

  replication {
    auto {}
  }
}
