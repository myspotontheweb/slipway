---
to: flux/infrastructure/controllers/cloudnative-pg/Namespace.yaml
force: true
---
apiVersion: v1
kind: Namespace
metadata:
  name: cnpg
  labels:
    pod-security.kubernetes.io/enforce: baseline