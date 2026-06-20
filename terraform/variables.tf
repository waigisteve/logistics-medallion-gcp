variable "project_name" {
  type    = string
  default = "logistics-medallion"
}

variable "environment" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "bigquery_location" {
  type        = string
  description = "BigQuery dataset location for native GCP analytical serving."
  default     = "US"
}

variable "bigquery_dataset_ids" {
  type        = list(string)
  description = "Ordered dataset IDs for curated BigQuery serving layers."
  default     = ["silver", "gold"]
}
