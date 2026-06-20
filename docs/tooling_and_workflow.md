# GCP Tooling And Workflow

## Stage Map

| Stage | Tool | Input | Output | Operational Focus |
|---|---|---|---|---|
| Producer ingress | `Pub/Sub` | Shipment, GPS, hub, and temperature events | Buffered ordered or unordered event streams | Backlog, throughput, retention |
| Contract validation | `Pub/Sub Schemas` | Producer payload schemas | Accepted or rejected message contracts | Version compatibility |
| Bronze persistence | `Dataflow` or export to `Cloud Storage` | Raw subscribed events | Immutable bronze objects | Replayability, storage lifecycle |
| Stream processing | `Dataflow` | Bronze/raw event stream | Silver canonical records and quarantine records | Freshness, lateness, duplicate suppression |
| Curated storage | `Cloud Storage` + `Parquet/Iceberg` | Validated records | Silver and gold datasets | Partitioning, compaction |
| Native analytics | `BigQuery` | Silver and gold curated outputs | Gold marts, serving tables, and SQL transforms | Query cost, latency, concurrency |
| Orchestration | `Cloud Composer` or `Workflows` | Pipeline tasks and replays | Scheduled and event-driven control plane actions | Promotions, backfills |
| Governance | `Dataplex` | Curated zones and metadata | Policy-managed data domains | Access, lineage, stewardship |
| Optional cross-cloud warehouse | `Snowflake` | Gold curated outputs | Dashboard, finance, and DS marts | Query latency, credit control |

## Recommended GCP Data Domains

- `transport_events`
- `shipment_status`
- `hub_operations`
- `reference_master_data`
- `quarantine_events`

## Recommended GCS Layout

```text
gs://<project>-bronze/raw/source_system=<source>/event_date=<yyyy-mm-dd>/hour=<hh>/
gs://<project>-silver/domain=<domain>/event_date=<yyyy-mm-dd>/hour=<hh>/
gs://<project>-gold/mart=<mart>/snapshot_date=<yyyy-mm-dd>/
```

## Recommended Orchestration Split

- `Dataflow`: continuous streaming transforms
- `BigQuery`: native gold marts, scheduled SQL, and BI-facing serving
- `Cloud Composer`: batch replays, backfills, quality tests, and warehouse load control
- `Workflows`: lightweight promotion or control-plane automation where Composer is unnecessary
