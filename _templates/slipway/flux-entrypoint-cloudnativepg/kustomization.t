---
to: flux/clusters/<%=clusterName%>/infrastructure-controller-cloudnativepg.yaml
force: true
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: infrastructure-controller-cloudnativepg
  namespace: flux-system
spec:
  dependsOn:
    - name: infrastructure-controller-cert-manager
  interval: 1h
  retryInterval: 2m
  timeout: 5m
  sourceRef:
    kind: GitRepository
    name: flux-system
  path: flux/infrastructure/controllers/cloudnativepg
  prune: true
  wait: true