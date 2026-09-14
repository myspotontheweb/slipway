---
to: flux/clusters/<%=clusterName%>/controller-cert-manager.yaml
force: true
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: controller-cert-manager
  namespace: flux-system
spec:
  interval: 1h
  retryInterval: 2m
  timeout: 5m
  sourceRef:
    kind: GitRepository
    name: flux-system
  path: flux/infrastructure/controllers/cert-manager
  prune: true
  wait: true