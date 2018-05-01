#! /bin/bash

set -exu

if [ $# -ne 1 ]; then
    echo "./k8s-init.sh [master name]"
    exit 0
fi

# Copy config file in master node.
vagrant scp ./yaml/k8s-config.yaml $1:k8s-config.yaml
# Initialize master node
# vagrant ssh $1 -c "sudo kubeadm init --config=k8s-config.yaml"
# Set kube-config for user as vagrant
# vagrant ssh $1 -c "mkdir -p ~/.kube && sudo cp -f /etc/kubernetes/admin.conf ~/.kube/config && sudo chown vagrant:vagrant ~/.kube/config"


# # Install CNI with Calico
# vagrant ssh $1 -c "kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml"

# vagrant ssh $1 -c "kubectl apply -f  https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml"


# Create admin user as service account
# vagrant scp ./yaml/sa-admin.yaml $1:sa-admin.yaml
# vagrant ssh $1 -c "kubectl apply -f sa-admin.yaml"
namespace="sapzil"
server=`vagrant ssh $1 -c "kubectl config view -o jsonpath='{.clusters[0].cluster.server}'"`
secret=`vagrant ssh $1 -c "kubectl -n $namespace get sa admin -o jsonpath="{.secrets[0].name}""`
token=`vagrant ssh $1 -c "kubectl -n $namespace get secret $secret -o jsonpath='{.data.token}' | base64 -d"`

#local kube-config 설정
#namespace: sapzil
kubectl config set-cluster k8s.nogada.dev --server=$server --insecure-skip-tls-verify=true
kubectl config set-context $namespace --cluster=k8s.nogada.dev
kubectl config set-credentials admin --token=$token
kubectl config set-context $namespace --user=admin --namespace=$namespace
#namespace: kube-system
kubectl config set-context kube --cluster=k8s.nogada.dev
kubectl config set-context kube --user=admin --namespace=kube-system
#current setting
kubectl config use-context kube
