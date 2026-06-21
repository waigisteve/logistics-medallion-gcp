# GCP Architecture Workflow

<table>
  <tr>
    <td align="center"><img src="assets/icons/pubsub.svg" width="56" alt="Pub Sub"><br><strong>Pub/Sub</strong><br>Ingestion bus</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/cloud-storage.svg" width="56" alt="Cloud Storage"><br><strong>Cloud Storage</strong><br>Bronze raw landing</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/dataflow.svg" width="56" alt="Dataflow"><br><strong>Dataflow</strong><br>Streaming validation and enrichment</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/cloud-storage.svg" width="56" alt="Cloud Storage"><br><strong>Cloud Storage Silver</strong><br>Parquet or Iceberg curated lake</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/bigquery.svg" width="56" alt="BigQuery"><br><strong>BigQuery</strong><br>Native gold marts and serving</td>
    <td align="center">or</td>
    <td align="center"><img src="assets/icons/snowflake.svg" width="56" alt="Snowflake"><br><strong>Snowflake</strong><br>Cross-cloud serving standard</td>
  </tr>
</table>

## Control Overlay

<table>
  <tr>
    <td align="center"><img src="assets/icons/security-command-center.svg" width="44" alt="Security Command Center"><br><strong>Security Command Center</strong><br>Exposure and intrusion detection</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/cloud-storage.svg" width="44" alt="Cloud Storage"><br><strong>Cloud Storage Versioning</strong><br>Delete recovery and replay safety</td>
    <td align="center">→</td>
    <td align="center"><img src="assets/icons/bigquery.svg" width="44" alt="BigQuery"><br><strong>BigQuery Audit Control</strong><br>Serving-layer integrity and controlled deletion</td>
  </tr>
</table>
