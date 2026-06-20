# GCP Deployment Sequence

## Dev

1. Deploy `security`, `streaming`, and `data_lake`.
2. Configure schema registry and synthetic publishers.
3. Deploy `processing` with low-cost capacity.
4. Validate freshness, duplicate handling, and quarantine routing.

## Test

1. Promote validated Terraform to `test`.
2. Run burst, replay, late-event, and failure-recovery tests.
3. Validate Snowflake loads and dashboard latency over realistic history.

## Prod

1. Freeze interface contracts and approve release artifacts.
2. Apply infrastructure with manual approval.
3. Enable real producers gradually by source or geography.
4. Observe SLOs and rollback if freshness, duplication, or schema alarms breach thresholds.
