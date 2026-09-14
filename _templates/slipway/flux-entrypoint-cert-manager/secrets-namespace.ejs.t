---
to: flux/secrets/<%=clusterName%>/cert-manager/namespace.yaml
force: true
---
apiVersion: v1
kind: Namespace
metadata:
  name: cert-manager
  labels:
    pod-security.kubernetes.io/enforce: baseline