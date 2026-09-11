# Slipway

> a slope built leading down into water, used for launching and landing boats and ships or for building and repairing them.

Slipway tries to simplify the creation and Kubernetes based projects that use GitOps as a strategy to manage configuration.

# Quick start

## Technologies

* [Git - Source Code Management](https://git-scm.com/)
* [Hygen code generator](https://github.com/jondot/hygen)
* [Github cli](https://cli.github.com/)
* [eksctl - AWS EKS commandline](https://eksctl.io/)
* [FluxCD - GitOps tool for controlling configuration](https://fluxcd.io/)
* [Kustomize - Kubernetes YAML generator](https://kustomize.io/)
* [Changie - Automated changelog tool for preparing releases](https://changie.dev/)

## Create and populate a new Github repository

TODO

# Miscellaneous

## Software installation

CLI tools are managed using [Homebrew](https://brew.sh/), which supports both MacOS and Linux. 
Dependencies are listed in the [Brewfile](Brewfile)

```bash
brew bundle install
```

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
