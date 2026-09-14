---
to: flux/infrastructure/controllers/cloudnativepg/Namespace.yaml
force: true
---
apiVersion: v1
kind: Namespace
metadata:
  name: cnpg
  labels:
    pod-security.kubernetes.io/enforce: baseline