user := $(shell id -u)
group := $(shell id -g)
clientid= 7Neh6Ja1bKW7c58uOjQ0dE5gNe0lClxc
clientsecret= Oj2s-THh_uFqZcu_RLGYaguizOHrtfqxWekgY4p2VtQhW6UVxusGIe8jLl7Lh4S_
test:
	@echo $(clientid) "+" $(clientsecret)
config:
	mkdir -p ~/.kube
	sudo rm -rf ~/.kube/config
	sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
	sudo chown $(user):$(group) ~/.kube/config
init: 
	sudo kubeadm init  --config=/vagrant/vm/master.yaml
	
rbac:
	kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
cni:
	kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

02:
	@echo "Create OIDC Secrets"
	kubectl create secret \
  		-n kube-system \
  		generic \
  		kube-dashboard-secrets \
  		--from-literal=client_id=$(clientid) \
  		--from-literal=client_secret=$(clientsecret) \
  		--from-literal=session=hjkljhkljsdfi9hlkjh
03:
	kubectl apply -f bundle.yaml --validate=false

04:
	kubectl apply -f roles.yaml --validate=false

clean:
	sudo kubeadm reset
	rm -rf ~/.kube/config
