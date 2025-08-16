
resource "helm_release" "minio" {
  name       = "minio"
  namespace  = "minio"
  repository = "https://charts.min.io/"
  chart      = "minio"
  version    = "5.0.15" # check latest version
  create_namespace = true

  values = [<<EOF
auth:
  rootUser: root
  rootPassword: q1w2e3r4100@

defaultBuckets: "velero,terraform,loki"

persistence:
  enabled: true
  size: 10Gi

service:
  type: ClusterIP 
EOF
  ]
}
