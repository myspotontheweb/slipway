---
to: flux/infrastructure/controllers/cert-manager/trust-manager-helmrelease.yaml
force: true
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: trust-manager
  namespace: cert-manager
spec:
  dependsOn:
    - name: cert-manager
  chart:
    spec:
      chart: trust-manager
      version: "<%=trustManagerChartVersion%>"
      sourceRef:
        kind: HelmRepository
        name: cert-manager
        namespace: cert-manager
  install:
    createNamespace: false
    remediation:
      retries: 3
  interval: 1h
  timeout: 10m
  values:
    app:
      trust:
        namespace: cert-manager