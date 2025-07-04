# Slipway

> a slope built leading down into water, used for launching and landing boats and ships or for building and repairing them.

Slipway tries to simplify the setup of a new Kubernetes based software project. It is implemented as a [copier](https://copier.readthedocs.io/) template
that creates a GitOps repository used by [FluxCD](https://fluxcd.io/) to configure EKS clusters for dev, staging and production. 

# Quick start

## Technologies

* [Copier - CLI app for rendering project templates](https://copier.readthedocs.io)
* [Git - Source Code Management](https://git-scm.com/)
* [Github cli](https://cli.github.com/)
* [eksctl - AWS EKS commandline](https://eksctl.io/)
* [FluxCD - GitOps tool for controlling configuration](https://fluxcd.io/)
* [Kustomize - Kubernetes YAML generator](https://kustomize.io/)
* [Changie - Automated changelog tool for preparing releases](https://changie.dev/)


## Create and populate a new Github repository

Start a new project by creating a new repository to manage EKS clusters

```bash
REPO_NAME=slipway-demo
REPO_OWNER=my-name

#
# Create new repository
#
gh repo create $REPO_OWNER/$REPO_NAME --add-readme --description "GitOps repository using slipway template" --clone --private

#
# Populate the repository
#
copier copy gh:myspotontheweb/slipway --data repo_name=$REPO_NAME --data repo_owner=$REPO_OWNER $REPO_NAME

#
# Commit files
#
git -C $REPO_NAME add .
git -C $REPO_NAME commit -am "Initial commit"
git -C $REPO_NAME push
```

### Sample repository

* https://github.com/myspotontheweb/slipway-demo

## Create an EKS cluster

The repository contains configuration which can be used to create an EKS cluster for dev, staging or production: 

```bash
export AWS_PROFILE=development
export GITHUB_TOKEN=$(gh auth token)

eksctl create cluster -f bootstrap/eks/cluster-dev1.yaml
```

Sample configuration file for [eksctl](https://eksctl.io/)

* [bootstrap/eks/cluster-dev1.yaml](https://github.com/myspotontheweb/slipway-demo/blob/main/bootstrap/eks/cluster-dev1.yaml)

# Miscellaneous

## Release

This project uses [changie](https://changie.dev/) for release management. New issues are created using this command:

```bash
changie new
```

Releases are created as follows.

```bash
changie batch auto
changie merge

git add .
git commit -m "Release: $(changie latest)"
git push

gh release create $(changie latest) --notes-file .changes/$(changie latest).md
```
