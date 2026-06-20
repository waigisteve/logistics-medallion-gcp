# GCP Cost Model

## Main Cost Drivers

- `Pub/Sub` throughput and retention
- `Dataflow` worker, memory, and streaming resources
- `Cloud Storage` capacity, operations, and egress
- `Snowflake` credits for curated loads and marts

## Main Cost Levers

- Keep bronze replay retention aligned to incident response needs
- Use autoscaling for streaming workers
- Compact silver and gold files to avoid downstream scan waste
- Separate operational serving from finance and DS compute
- Use batch backfills outside operational peak windows

## Common Failure Modes

- Over-retaining high-volume topics
- Letting small files accumulate in curated layers
- Mixing expensive exploratory workloads into the same serving path as operations
- Reprocessing full history for late events instead of affected partitions only
