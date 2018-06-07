#! /bin/bash

set -exu

if [ $# -ne 1 ]; then
    echo "./k8s-cni.sh [master name]"
    exit 0
fi

# Install CNI with Calico
vagrant ssh $1 -c "kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml"
vagrant ssh $1 -c "kubectl apply -f  https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml"