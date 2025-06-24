# Slipway

> a slope built leading down into water, used for launching and landing boats and ships or for building and repairing them.

This project is a [copier](https://copier.readthedocs.io/) template which initializes a project that uses [FluxCD](https://fluxcd.io/) to manage 
the configuration of an [AWS EKS](https://aws.amazon.com/eks/) cluster 

# Quick start

# Technologies

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

## Create an EKS cluster

The slipway repository uses the [eksctl](https://eksctl.io/) tool to launch a new EKS cluster, managed usign FluxCD

```bash
cd slipway-demo

#
# Create a new cluster
#
export AWS_PROFILE=development
export GITHUB_TOKEN=$(gh auth token)

eksctl create cluster -f bootstrap/eks/cluster-dev1.yaml
```

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
