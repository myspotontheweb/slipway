---
to: flux/secrets/<%=clusterName%>/cloudnativepg/kustomization.yaml
force: false
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: cnpg
resources:
- namespace.yaml