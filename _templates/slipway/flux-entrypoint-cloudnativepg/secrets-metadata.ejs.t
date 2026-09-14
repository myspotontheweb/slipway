---
to: flux/secrets/<%=clusterName%>/cloudnativepg/kustomization.yaml
force: true
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: cloudnativepg
resources:
- namespace.yaml