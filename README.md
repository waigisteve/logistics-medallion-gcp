# GCP Route

This route implements the scenario with:

- `Pub/Sub`
- `Cloud Storage`
- `Dataflow`
- `BigQuery`
- `Cloud Composer` or `Workflows`
- `Dataplex`
- `Snowflake` when cross-cloud warehouse standardization is required

## Repository Navigation

- `docs/implementation_plan.md`
- `docs/tooling_and_workflow.md`
- `docs/deployment_sequence.md`
- `docs/cost_model.md`
- `terraform/README.md`

## Route Intent

This route is for a production-grade streaming implementation on GCP using managed eventing and managed stream processing. It is designed for:

- `<5 minute` shipment-status freshness
- `<10 second` dashboard reads through curated gold outputs in `BigQuery` or `Snowflake`
- Schema-drift detection before bad payloads contaminate silver and gold
- Controlled cost through autoscaling, compaction, storage lifecycle, and isolated compute domains

## Defined Tools

| Stage | Primary Tool | Role |
|---|---|---|
| Ingestion | `Pub/Sub` | Accept vehicle, shipment, and hub events with replayable retention |
| Bronze landing | `Dataflow` or Pub/Sub export to `Cloud Storage` | Persist immutable raw events |
| Schema control | `Pub/Sub Schemas` | Validate producer contracts and versioning rules |
| Stream processing | `Dataflow` with `Apache Beam` | Flatten, deduplicate, enrich, watermark, and quarantine |
| Silver/Gold lake | `Cloud Storage` + `Parquet/Iceberg` | Curated medallion storage |
| Native serving | `BigQuery` | Default GCP analytical layer for gold marts, SQL transforms, and BI |
| Orchestration | `Cloud Composer` or `Workflows` | Replays, backfills, tests, and warehouse loading |
| Governance | `Dataplex` | Metadata policy and zone governance |
| Optional external serving | `Snowflake` | Cross-cloud dashboard, finance, and DS serving models |

## Scaffold Contents

- `docs/implementation_plan.md`: route workflow and implementation plan
- `docs/tooling_and_workflow.md`: tool definitions and end-to-end stage mapping
- `docs/deployment_sequence.md`: how to roll out `dev`, `test`, and `prod`
- `docs/cost_model.md`: cost levers and risk areas
- `terraform/`: modular scaffold with environment entry points
- `.github/workflows/terraform.yml`: CI validation skeleton

## Recommended GCP Patterns

- `Native GCP`: `Pub/Sub -> Dataflow -> Cloud Storage/Iceberg -> BigQuery`
- `Cross-cloud standard`: `Pub/Sub -> Dataflow -> Cloud Storage/Iceberg -> Snowflake`

If the target is a pure GCP implementation, `BigQuery` should normally be the default gold-serving layer.

## Terraform Structure

- `terraform/security`: Cloud KMS and service accounts
- `terraform/streaming`: Pub/Sub topic and subscription
- `terraform/data_lake`: bronze, silver, and gold buckets and lake policy anchors
- `terraform/processing`: Dataflow service account and pipeline placeholders
- `terraform/warehouse_integration`: BigQuery dataset anchors for native serving plus optional Snowflake integration
- `terraform/observability`: monitoring primitives for freshness and failure signals

## Environments

- `terraform/envs/dev`
- `terraform/envs/test`
- `terraform/envs/prod`
