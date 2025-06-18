# fluxcd-copier-template
A copier template to create a project using FluxCD

# Quick start

The following command will generate the project files

```bash
copier copy gh:myspotontheweb/fluxcd-copier-template . --exclude LICENSE --exclude README.md
```
```
Copying from template version 0.0.0.post2.dev0+8bd8ea3
    create  bootstrap
    create  bootstrap/eks
    create  bootstrap/eks/cluster-dev1.yaml
    create  bootstrap/eks/cluster-staging1.yaml
    create  bootstrap/eks/cluster-prod1.yaml
    create  clusters
    create  clusters/dev1
    create  clusters/staging1
    create  clusters/prod1
    create  clusters/dev1/gitops.yaml
    create  clusters/staging1/gitops.yaml
    create  clusters/prod1/gitops.yaml
    create  .copier-answers.yml
    create  infrastructure
    create  infrastructure/configs
    create  infrastructure/configs/overlays
    create  infrastructure/configs/overlays/dev1
    create  infrastructure/configs/overlays/staging1
    create  infrastructure/configs/overlays/prod1
    create  infrastructure/configs/overlays/dev1/kustomization.yaml
    create  infrastructure/configs/overlays/staging1/kustomization.yaml
    create  infrastructure/configs/overlays/prod1/kustomization.yaml
    create  infrastructure/configs/base
    create  infrastructure/configs/base/kustomization.yaml
    create  infrastructure/configs/base/selfsigned-cluster-issuer.yaml
    create  infrastructure/controllers
    create  infrastructure/controllers/overlays
    create  infrastructure/controllers/overlays/dev1
    create  infrastructure/controllers/overlays/staging1
    create  infrastructure/controllers/overlays/prod1
    create  infrastructure/controllers/overlays/dev1/kustomization.yaml
    create  infrastructure/controllers/overlays/staging1/kustomization.yaml
    create  infrastructure/controllers/overlays/prod1/kustomization.yaml
    create  infrastructure/controllers/base
    create  infrastructure/controllers/base/kustomization.yaml
    create  infrastructure/controllers/base/cert-manager.yaml
    create  apps
    create  apps/prod
    create  apps/prod/prod-namespace.yaml
    create  apps/staging
    create  apps/staging/staging-namespace.yaml
    create  apps/dev
    create  apps/dev/dev-namespace.yaml
```

Commit these files to an empty repository

```bash
git add .
git commit -am "Initial files"
git push
```

Create a dev cluster

```bash
export AWS_PROFILE=development
export GITHUB_TOKEN=$(gh auth token)

eksctl create cluster -f bootstrap/eks/cluster-dev1.yaml
```

Update generated files later

```
copier update --defaults --exclude LICENSE --exclude README.md
```

# Miscellaneous

## Release

```bash
changie batch auto
changie merge

git add .
git commit -m "Release: $$(changie latest)"
git push

gh release create $$(changie latest) --notes-file .changes/$$(changie latest).md
```