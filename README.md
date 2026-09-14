# Slipway

> a slope built leading down into water, used for launching and landing boats and ships or for building and repairing them.

Slipway tries to simplify the creation and Kubernetes based projects that use GitOps as a strategy to manage configuration.

# Quick start

## Software

CLI tools are managed using [Homebrew](https://brew.sh/), which supports both MacOS and Linux. Dependencies are listed in the [Brewfile](Brewfile)

```bash
brew bundle install
```

## Launch a cluster

Login to AWS

```bash
export AWS_PROFILE=myprofile
export AWS_REGION=eu-west-1

aws sso login
```

Generate configuration files

```bash
#
# The logic for each component
#
hygen slipway flux-cert-manager
hygen slipway flux-cloudnativepg

#
# Configure this cluster to run various components
#
hygen slipway flux-entrypoint-cert-manager --clusterName demo
hygen slipway flux-entrypoint-cloudnativepg --clusterName demo

#
# Generate a EKS configuration file for this cluster
#
hygen slipway eksctl-config --clusterName demo --githubOwner myspotontheweb --repoName slipway
```

Launch the EKS cluster

```bash
export GITHUB_TOKEN=$(gh auth token)

eksctl create cluster -f eks/config/demo.yaml
```

Load SOPS decryption key and kick-start Flux

```bash
age-keygen -o age.agekey
kubectl create secret generic sops-age -n flux-system --from-file age.agekey
flux reconcile kustomization secrets-cert-manager
flux reconcile kustomization secrets-cloudnativepg
```

## Cleanup

```bash
eksctl delete cluster -f eks/config/demo.yaml
```

# Documentation

* [Local Kubernetes Environment](docs/local-kubernetes-environment.md)
* [Release Managment](docs/release-management.md)
* [Secrets Management](docs/secrets-managment.md)

# Technologies

* [Git - Source Code Management](https://git-scm.com/)
* [Hygen code generator](https://github.com/jondot/hygen)
* [Github cli](https://cli.github.com/)
* [eksctl - AWS EKS commandline](https://eksctl.io/)
* [FluxCD - GitOps tool for controlling configuration](https://fluxcd.io/)
* [Kustomize - Kubernetes YAML generator](https://kustomize.io/)
* [Changie - Automated changelog tool for preparing releases](https://changie.dev/)
