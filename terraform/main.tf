module "security" {
  source      = "./modules/security"
  name_prefix = local.name_prefix
  region      = var.region
}

module "streaming" {
  source      = "./modules/streaming"
  name_prefix = local.name_prefix
}

module "data_lake" {
  source      = "./modules/data_lake"
  name_prefix = local.name_prefix
  labels      = local.labels
}

module "processing" {
  source      = "./modules/processing"
  name_prefix = local.name_prefix
  project_id  = var.project_id
  region      = var.region
}

module "warehouse_integration" {
  source      = "./modules/warehouse_integration"
  name_prefix = local.name_prefix
  project_id  = var.project_id
  location    = var.bigquery_location
  labels      = local.labels
  dataset_ids = var.bigquery_dataset_ids
}

module "observability" {
  source      = "./modules/observability"
  name_prefix = local.name_prefix
}
