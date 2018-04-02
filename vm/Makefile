init:
	sudo kubeadm init  --config=/vagrant/vm/master.yaml
	mkdir -p ~/.kube
	sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
	sudo chown $(id -u):$(id -g) ~/.kube/config
rbac:
	kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
cni:
	kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

clean:
	sudo kubeadm reset
	rm -rf $HOME/.kube/config
