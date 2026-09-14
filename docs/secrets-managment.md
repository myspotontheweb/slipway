# Secrets Management

## Configure SOPS

```bash
#
# Generate age key
#
rm -f age.agekey age.agekey.pub
age-keygen -o age.agekey
age-keygen -y age.agekey > age.agekey.pub

#
# Create SOPS configuration file
#
export SOPS_CONFIG=$(git rev-parse --show-toplevel)/.sops.yaml

echo "" > $SOPS_CONFIG
yq -i '.creation_rules[0].path_regex = "flux/secrets/.*\.sops\.yaml$"' $SOPS_CONFIG
yq -i '.creation_rules[0].encrypted_regex = "^(data|stringData)$"' $SOPS_CONFIG
yq -i '.creation_rules[0].key_groups[0].age[0] += load("age.agekey.pub")' $SOPS_CONFIG                      # Age public key
yq -i '.creation_rules[0].key_groups[0].age[1] += load(strenv(HOME) + "/.ssh/id_ed25519.pub")' $SOPS_CONFIG # SSH public key
```

## Add a secret

```bash
#
# Generate a secret and Encrypt in place
#
kubectl create secret generic my-secret \
  --from-literal=username='admin' \
  --from-literal=password='supersecret' \
  --dry-run=client -o yaml > flux/secrets/local/cloudnativepg/my-secret.sops.yaml

sops -e -i flux/secrets/local/cloudnativepg/my-secret.sops.yaml

#
# Update kustomization.yaml
#
rm flux/secrets/local/cloudnativepg/kustomization.yaml
(cd flux/secrets/local/cloudnativepg; kustomize create --autodetect --namespace cnpg)

#
# Test decryption and generation
#
sops -d flux/secrets/local/cloudnativepg/my-secret.sops.yaml
kustomize build flux/secrets/local/cloudnativepg
```
