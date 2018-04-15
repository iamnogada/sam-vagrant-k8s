dashboard:
	kubectl create secret generic kubernetes-dashboard-certs --from-file=./yaml/cert -n kube-system 
	kubectl create -f ./yaml/dashboard/ -n kube-system
mon:
	kubectl create -f yaml/monitoring/

helm:
	helm init
	kubectl apply -f ./yaml/helm/
	kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

ingress:
	kubectl apply -f ./yaml/ingress


clean:
	kubectl delete secret kubernetes-dashboard-certs
	kubectl delete -f ./yaml/dashboard/ -n kube-system
	kubectl delete -f yaml/monitoring/