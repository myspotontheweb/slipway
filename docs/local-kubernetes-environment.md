
# Local Kubernetes Environment

On a Mac running [Colima](https://colima.run/) as an alternative to Docker Desktop, [which is not open source](https://docs.docker.com/subscription-billing/desktop-license/)
Colima can run a [k3s](https://k3s.io/) based Kubernetes cluster locally as follows


```bash
colima start --kubernetes --cpus 4 --memory 8 --network-address
```

Generate Flux files

```bash
#
# Configure this cluster to run various controllers
#
hygen slipway flux-entrypoint-cert-manager --clusterName local
hygen slipway flux-entrypoint-cloudnativepg --clusterName local

#
# The install logic for each controller
#
hygen slipway flux-controller-cert-manager
hygen slipway flux-controller-cloudnativepg


#
# Commit changes so that Flux can pick them up
#
```

Bootstrap FluxCD

```bash
export GITHUB_TOKEN=$(gh auth token)

flux bootstrap github \
   --context colima \
   --owner=myspotontheweb \
   --repository=slipway \
   --branch=main \
   --path=flux/clusters/local
```

Clean up

```bash
colima delete default
```