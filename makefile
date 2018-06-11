dashboard:
	kubectl create secret generic kubernetes-dashboard-certs --from-file=./yaml/cert -n kube-system 
	kubectl create -f ./yaml/dashboard/dashboard.yaml -n kube-system
mon:
	kubectl create -f yaml/monitoring/
metric:
	kubectl apply -f ./yaml/metrics-server -n kube-system
helm:
	helm init
	kubectl apply -f ./yaml/helm/
	kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

ingress:
	kubectl apply -f ./yaml/ingress

dex:
	kubectl create secret tls dex.example.com.tls --cert=yaml/dex/ssl/cert.pem --key=yaml/dex/ssl/key.pem
	kubectl create secret \
    generic github-client \
    --from-literal=client-id=aafcb1b87fe91888f00d \
    --from-literal=client-secret=237c85347c82ba06f94fe7e74c842f1f8ef99d7d
	kubectl apply -f yaml/dex/dex.yaml

clean:
	kubectl delete secret kubernetes-dashboard-certs
	kubectl delete -f ./yaml/dashboard/ -n kube-system
	kubectl delete -f ./yaml/monitoring/
