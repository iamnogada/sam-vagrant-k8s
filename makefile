
all: setup apps mon

setup: 
	rm -rf ~/.kube/config
	cp provision/files/config ~/.kube/config

apps: setup
	kubectl create -f k8s-addon/k8s-dashboard.yaml
	#kubectl create -f k8s-addon/dashboard-admin.yaml
	open https://172.168.0.10:30000

mon: setup
	kubectl create -f k8s-addon/influxdb/
	kubectl create -f k8s-addon/rbac/heapster-rbac.yaml
	open http://172.168.0.10:30001

	
clean:
	kubectl delete -f k8s-addon/k8s-dashboard.yaml
	kubectl delete -f k8s-addon/dashboard-admin.yaml
	kubectl delete -f k8s-addon/influxdb/
	kubectl delete -f k8s-addon/rbac/heapster-rbac.yaml

addUser:
	kubectl create namespace nogada
	#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')


