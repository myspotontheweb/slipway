# Slipway

A copier template to create a project using FluxCD

# Quick start

To start a new project by creating a new repository

```bash
REPO_NAME=slipway-demo
REPO_OWNER=moconnor-cni

#
# Create new repository
#
gh repo create $REPO_OWNER/$REPO_NAME --add-readme --description "GitOps repository using slipway template" --private --clone

#
# Populate the repository
#
copier copy gh:myspotontheweb/slipway --data repo_name=$REPO_NAME --data repo_owner=$REPO_OWNER $REPO_NAME

#
# Commit files
#
cd $REPO_NAME
git add .
git commit -am "Initial commit"
git push
```

Create a dev cluster, using [eksctl](https://eksctl.io/)

```bash
export AWS_PROFILE=development
export GITHUB_TOKEN=$(gh auth token)

eksctl create cluster -f bootstrap/eks/cluster-dev1.yaml
```

# Miscellaneous

## Release

```bash
changie batch auto
changie merge

git add .
git commit -m "Release: $(changie latest)"
git push

gh release create $(changie latest) --notes-file .changes/$(changie latest).md
```
