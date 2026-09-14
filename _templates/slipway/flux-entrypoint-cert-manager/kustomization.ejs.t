---
to: flux/clusters/<%=clusterName%>/cert-manager.yaml
force: true
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: secrets-cert-manager
  namespace: flux-system
spec:
  interval: 1h
  retryInterval: 2m
  timeout: 5m
  sourceRef:
    kind: GitRepository
    name: flux-system
  path: flux/secrets/<%=clusterName%>/cert-manager
  prune: true
  wait: true
  decryption:
    provider: sops
    secretRef:
      name: sops-age
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: controller-cert-manager
  namespace: flux-system
spec:
  dependsOn:
    - name: secrets-cert-manager
  interval: 1h
  retryInterval: 2m
  timeout: 5m
  sourceRef:
    kind: GitRepository
    name: flux-system
  path: flux/infrastructure/controllers/cert-manager
  prune: true
  wait: true
  postBuild:
    substitute:
      CERT_MANAGER_VERSION: "<%=certManagerVersion%>"
      TRUST_MANAGER_VERSION: "<%=trustManagerVersion%>"