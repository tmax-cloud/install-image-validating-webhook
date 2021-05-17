#!/bin/bash

set -e

bash manifests/webhook-create-signed-cert.sh
cat manifests/validating-webhook.yaml | bash manifests/webhook-patch-ca-bundle.sh > manifests/validating-webhook-ca-bundle.yaml

kubectl apply -f manifests/crd/tmax.io_signerpolicies.yaml
kubectl apply -f manifests/role/account.yaml
kubectl apply -f manifests/role/role.yaml
kubectl apply -f manifests/role/role-binding.yaml

kubectl apply -f manifests/whitelist-configmap.yaml
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml
kubectl apply -f manifests/validating-webhook-ca-bundle.yaml

echo "Deloying image-validation-webhook completed"

exit 0
