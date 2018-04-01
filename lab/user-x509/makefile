all: pk csr crt

namespace:
	kubectl create namespace lab7
pk:
	openssl genrsa -out one-leader.key 2048
csr:
	openssl req -new -key one-leader.key -out one-leader.csr -subj "/CN=one-leader/O=team-one"
crt:
	openssl x509 -req -in one-leader.csr -CA ../../pki/ca.crt  -CAkey ../../pki/ca.key -CAcreateserial -out one-leader.crt -days 3560
config:
	kubectl config set-credentials one-leader --client-certificate=one-leader.crt --client-key=one-leader.key
	kubectl config set-context team --cluster local --namespace=lab7 --user=one-leader
user:
	kubectl create -f rolebinding.yaml
	kubectl config use-context team
clean:
	kubectl delete -f rolebinding.yaml