#! /bin/bash

set -exu

if [ $# -ne 1 ]; then
    echo "./k8s-reset.sh [server name master or worker]"
    exit 0
fi

# run cmd in vms
vagrant ssh $1 -c "sudo kubeadm reset"

