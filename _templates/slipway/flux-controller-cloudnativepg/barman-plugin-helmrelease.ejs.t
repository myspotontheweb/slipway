---
to: flux/infrastructure/controllers/cloudnativepg/barman-plugin-helmrelease.yaml
force: true
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: plugin-barman-cloud 
  namespace: cnpg
spec:
  interval: 30m
  chart:
    spec:
      chart: plugin-barman-cloud
      version: "<%=barmanChartVersion%>"
      sourceRef:
        kind: HelmRepository
        name: cnpg
        namespace: cnpg
      interval: 12h
  values: {}  