
all: setup apps mon

setup: 
	rm -rf ~/.kube/config
	cp provision/files/config ~/.kube/config

apps: setup
	kubectl create secret generic kubernetes-dashboard-certs --from-file=./yaml/dashboard/cert -n kube-system 
	kubectl create -f yaml/k8s-dashboard.yaml
	open https://172.168.0.10:30000

mon: setup
	kubectl create -f yaml/influxdb/
	kubectl create -f yaml/rbac/heapster-rbac.yaml
	open http://172.168.0.10:30001

	
clean:
	kubectl delete secret kubernetes-dashboard-certs
	kubectl delete -f yaml/k8s-dashboard.yaml
	kubectl delete -f yaml/dashboard-admin.yaml
	kubectl delete -f yaml/influxdb/
	kubectl delete -f yaml/rbac/heapster-rbac.yaml

addUser:
	kubectl create namespace nogada
	#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')


