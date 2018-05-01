#! /bin/bash

if [ $# -ne 2 ]; then
    echo "./k8s-join.sh [master name] [worker name]"
    exit 0
fi

set -exu

vagrant ssh $2 -c "sudo `vagrant ssh $1  -c 'sudo kubeadm token create --print-join-command'`"