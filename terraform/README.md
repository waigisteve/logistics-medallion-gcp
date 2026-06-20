# GCP Terraform Scaffold

This scaffold is modular so the route can become an independent project with minimal restructuring.

## Modules

- `security`: encryption and service identity anchors
- `streaming`: Pub/Sub resources
- `data_lake`: bronze, silver, and gold storage resources
- `processing`: Dataflow-related runtime scaffolding
- `warehouse_integration`: native BigQuery dataset anchors plus optional Snowflake integration secrets
- `observability`: logs and metric resources

## Environments

- `envs/dev`
- `envs/test`
- `envs/prod`

Each environment is an entry point that calls the root module with environment-specific values.

## Native Analytics

The GCP route now provisions BigQuery dataset anchors for the curated serving layers by default:

- `silver`
- `gold`

These become environment-scoped dataset IDs in the form `project-environment_layer`, normalized for BigQuery naming.
