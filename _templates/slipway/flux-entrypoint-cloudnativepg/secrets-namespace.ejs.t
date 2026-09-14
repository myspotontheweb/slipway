---
to: flux/secrets/<%=clusterName%>/cloudnativepg/namespace.yaml
force: true
---
apiVersion: v1
kind: Namespace
metadata:
  name: cloudnativepg
  labels:
    pod-security.kubernetes.io/enforce: privileged