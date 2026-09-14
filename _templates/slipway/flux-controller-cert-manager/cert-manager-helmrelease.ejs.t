---
to: flux/infrastructure/controllers/cert-manager/cert-manager-helmrelease.yaml
force: true
---
apiVersion: helm.toolkit.fluxcd.io/v2
kind: HelmRelease
metadata:
  name: cert-manager
  namespace: cert-manager
spec:
  chart:
    spec:
      chart: cert-manager
      version: "<%=certManagerChartVersion%>"
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
    installCRDs: true
    webhook:
      timeoutSeconds: 10