variable "name_prefix" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

resource "google_service_account" "dataflow" {
  account_id   = replace("${var.name_prefix}-df", "-", "")
  display_name = "${var.name_prefix} dataflow"
}

resource "terraform_data" "dataflow_blueprint" {
  input = {
    runtime    = "apache_beam_dataflow"
    project_id = var.project_id
    region     = var.region
  }
}
