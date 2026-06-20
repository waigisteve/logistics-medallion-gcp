variable "name_prefix" {
  type = string
}

resource "google_pubsub_topic" "events" {
  name = "${var.name_prefix}-events"
}

resource "google_pubsub_subscription" "events" {
  name  = "${var.name_prefix}-events-sub"
  topic = google_pubsub_topic.events.name
}
