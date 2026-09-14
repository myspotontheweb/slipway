---
to: flux/clusters/<%=clusterName%>/controller-cloudnativepg.yaml
force: true
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: controller-cloudnativepg
  namespace: flux-system
spec:
  dependsOn:
    - name: controller-cert-manager
  interval: 1h
  retryInterval: 2m
  timeout: 5m
  sourceRef:
    kind: GitRepository
    name: flux-system
  path: flux/infrastructure/controllers/cloudnativepg
  prune: true
  wait: true
  postBuild:
    substitute:
      CNPG_VERSION: "<%=cnpgChartVersion%>"
      BARMAN_PLUGIN_VERSION: "<%=barmansPluginVersion%>"