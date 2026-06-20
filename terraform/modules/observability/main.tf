variable "name_prefix" {
  type = string
}

resource "google_logging_metric" "freshness_lag" {
  name   = "${var.name_prefix}_freshness_lag"
  filter = "resource.type=\"dataflow_step\""

  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}
