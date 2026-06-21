# GCP Integrity And Security Controls

## Data Deletion

- `Pub/Sub` retention preserves replay if downstream layers are damaged.
- `Cloud Storage` object versioning protects bronze and curated datasets.
- `BigQuery` dataset and table deletion must be controlled and audited, with rebuild paths from silver.

## Data Duplication

- `Dataflow` should enforce deterministic keys, watermarks, and idempotent downstream writes.
- Bronze keeps raw duplicates for auditability.
- BigQuery or Snowflake serving loads must stay incremental and idempotent.

## Security Infiltration

- Use distinct identities for publishers, processors, orchestration, and admins.
- `Security Command Center` and audit logs should detect access anomalies, exposed resources, and suspicious deletes.
- Separate serving and processing permissions so compromise blast radius is contained.

## Integrity Outcome

The route stays trustworthy because replay, versioning, deduplication, and audited serving-layer controls all work together.
