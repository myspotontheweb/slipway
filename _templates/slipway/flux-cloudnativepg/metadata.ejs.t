---
to: flux/infrastructure/controllers/cloudnativepg/kustomization.yaml
force: true
---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- namespace.yaml
- helmrepository.yaml
- cnpg-helmrelease.yaml
- barman-plugin-helmrelease.yaml
