# GCP Implementation Plan

## End-to-End Workflow

1. Publish into `Pub/Sub`.
2. Persist immutable bronze events in `Cloud Storage`.
3. Validate contracts with `Pub/Sub Schemas` and route invalid messages to quarantine.
4. Process valid events in `Dataflow` with event-time semantics, deduplication, and enrichment.
5. Write silver outputs in `Parquet` or `Iceberg`.
6. Build gold aggregates in `BigQuery` as the native GCP serving layer, or in `Snowflake` when cross-cloud warehouse standardization is required.
7. Use `Cloud Composer` or `Workflows` for replay, backfill, and controlled promotion.

## Why GCP

- Strong managed streaming ergonomics.
- Beam/Dataflow is a clean fit for event-time and replay-aware pipelines.
- `BigQuery` is the native analytical warehouse and should be the default GCP gold-serving option unless a Snowflake-first enterprise standard overrides it.
- Good fit when the team wants autoscaling and a smaller day-2 operations footprint than a more cluster-heavy design.

## Medallion Design

| Layer | GCP Implementation |
|---|---|
| Bronze | Immutable raw events in `Cloud Storage`, partitioned by ingestion date and hour |
| Silver | Canonical shipment, vehicle, temperature, and hub event tables in `Parquet/Iceberg` |
| Gold | Aggregated SLA, status, reconciliation, and feature-engineering outputs served from `BigQuery` or loaded into `Snowflake` |

## Tool Definitions

| Tool | Why It Is Here |
|---|---|
| `Pub/Sub` | Durable ingestion backbone for bursty producer traffic |
| `Pub/Sub Schemas` | Producer contract validation and schema version control |
| `Dataflow` | Streaming transforms, late data handling, and scalable event processing |
| `Cloud Storage` | Bronze, silver, and gold object storage |
| `BigQuery` | Native analytical serving, SQL transformation, and BI-facing gold datasets |
| `Cloud Composer` or `Workflows` | Controlled backfills, replay, data quality gates, and environment promotions |
| `Dataplex` | Metadata governance and zone policy organization |
| `Snowflake` | Optional cross-cloud consumer-facing serving layer |

## Cost Strategy

- Use autoscaling and Streaming Engine choices deliberately.
- Compact files and tier historical data.
- Keep finance and DS workloads separate from real-time operational serving.
- Use lifecycle rules to move bronze data to cheaper storage classes once replay windows close.

## Delivery Plan

1. `dev`: synthetic producers, contract tests, and latency validation
2. `test`: scale tests, replay tests, duplicate handling, and failover drills
3. `prod`: approved Terraform applies, guarded rollout, and post-deployment SLO observation

## Terraform Mapping

| Module | Responsibility |
|---|---|
| `security` | KMS, service-account trust, and encryption anchors |
| `streaming` | Pub/Sub topics and subscriptions |
| `data_lake` | Bronze, silver, and gold storage resources |
| `processing` | Dataflow service accounts and pipeline configuration placeholders |
| `warehouse_integration` | BigQuery dataset anchors and optional Snowflake integration secrets/connectors |
| `observability` | Monitoring and logging primitives |
