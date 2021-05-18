#!/bin/bash

set -e

kubectl delete -f manifests/validating-webhook-ca-bundle.yaml
kubectl delete -f manifests/service.yaml
kubectl delete -f manifests/deployment.yaml
kubectl delete -f manifests/whitelist-configmap.yaml

kubectl delete -f manifests/role/role-binding.yaml
kubectl delete -f manifests/role/role.yaml
kubectl delete -f manifests/role/account.yaml
kubectl delete -f manifests/crd/tmax.io_signerpolicies.yaml

kubectl delete secret image-validation-admission-certs

echo "Uninstalling image-validation-webhook completed"

exit 0
