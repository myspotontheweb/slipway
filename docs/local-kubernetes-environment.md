
# Local Kubernetes Environment

On a Mac running [Colima](https://colima.run/) as an alternative to Docker Desktop, [which is not open source](https://docs.docker.com/subscription-billing/desktop-license/)
Colima can run a [k3s](https://k3s.io/) based Kubernetes cluster locally as follows

```bash
colima start --kubernetes --cpus 4 --memory 8 --network-address
```

Generate Flux files

```bash
#
# The logic for each component
#
hygen slipway flux-cert-manager
hygen slipway flux-cloudnativepg

#
# Configure this cluster to run various components
#
hygen slipway flux-entrypoint-cert-manager --clusterName local
hygen slipway flux-entrypoint-cloudnativepg --clusterName local

#
# Commit changes so that Flux can pick them up
#
```

Test the YAML generation

```bash
#
# cert-manager 
#
flux build kustomization secrets-cert-manager \
  --kustomization-file flux/clusters/local/cert-manager.yaml \
  --path flux/secrets/local/cert-manager \
  --dry-run

flux build kustomization controller-cert-manager \
  --kustomization-file flux/clusters/local/cert-manager.yaml \
  --path flux/infrastructure/controllers/cert-manager \
  --dry-run

#
# cloudnativepg 
#
flux build kustomization secrets-cloudnativepg \
  --kustomization-file flux/clusters/local/cloudnativepg.yaml \
  --path flux/secrets/local/cloudnativepg \
  --dry-run

flux build kustomization controller-cloudnativepg \
  --kustomization-file flux/clusters/local/cloudnativepg.yaml \
  --path flux/infrastructure/controllers/cloudnativepg \
  --dry-run
```

Bootstrap FluxCD

```bash
export GITHUB_TOKEN=$(gh auth token)

flux bootstrap github \
   --context colima \
   --owner=myspotontheweb \
   --repository=slipway \
   --branch=refactor-2 \
   --path=flux/clusters/local
```

Load SOPS decryption key and kick-start Flux

```bash
age-keygen -o age.agekey
kubectl create secret generic sops-age -n flux-system --from-file age.agekey
flux reconcile kustomization secrets-cert-manager
flux reconcile kustomization secrets-cloudnativepg
```

Clean up

```bash
colima delete default
```