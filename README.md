<img width="1836" height="780" alt="image" src="https://github.com/user-attachments/assets/642340c8-1ad3-4f75-8dc2-264e040c83bf" />


###  Velero | Kubernetes ☸️
Velero is an open-source tool used for backing up and restoring Kubernetes cluster resources and persistent volumes. It's a crucial component for disaster recovery, enabling users to recover from data loss or cluster failure by restoring their Kubernetes environment to a previous state. Velero also facilitates migrations between Kubernetes clusters and helps create development and testing environments by replicating cluster resources


🧱 Key Features:
```
✅ Backup & Restore: Saves Kubernetes objects (like Deployments, Services, ConfigMaps, CRDs, etc.) and Persistent Volume data, so you can recover from accidental deletions or failures.
✅ Disaster Recovery: Helps you restore your entire cluster or specific namespaces after an outage.
✅ Migration: Lets you move workloads and persistent data between clusters (e.g., dev → prod or cloud provider A → B).
✅ Scheduled Backups: You can set up recurring backup jobs.
✅ Cloud Provider Integration: Stores backups in cloud object storage (AWS S3, GCP Cloud Storage, Azure Blob Storage, MinIO, etc.).
✅ Volume Snapshots: Integrates with CSI (Container Storage Interface) and cloud provider snapshot APIs to capture persistent volumes efficiently.
```

## Example

### AWS
```
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.10.0 \
    --bucket $BUCKET \
    --backup-location-config region=$REGION \
    --snapshot-location-config region=$REGION \
    --secret-file ./credentials-velero
```
### Google
```
velero install \
    --provider gcp \
    --plugins velero/velero-plugin-for-gcp:v1.12.0 \
    --bucket $BUCKET \
    --no-secret \
    --sa-annotations iam.gke.io/gcp-service-account=[$GSA_NAME]@[$PROJECT_ID].iam.gserviceaccount.com \
    --backup-location-config serviceAccount=[$GSA_NAME]@[$PROJECT_ID].iam.gserviceaccount.com \
```

🔨 Config :
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```
