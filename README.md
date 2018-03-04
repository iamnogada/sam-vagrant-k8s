<pre>
#     #                                                           
#  #  # ###### #       ####   ####  #    # ######    #####  ####  
#  #  # #      #      #    # #    # ##  ## #           #   #    # 
#  #  # #####  #      #      #    # # ## # #####       #   #    # 
#  #  # #      #      #      #    # #    # #           #   #    # 
#  #  # #      #      #    # #    # #    # #           #   #    # 
 ## ##  ###### ######  ####   ####  #    # ######      #    ####   
                                                                                                                     
           #####                   #     #                                ### 
          #     #   ##   #    #    #  #  #  ####  #####  #      #####     ### 
          #        #  #  ##  ##    #  #  # #    # #    # #      #    #    ### 
           #####  #    # # ## #    #  #  # #    # #    # #      #    #     #  
                # ###### #    #    #  #  # #    # #####  #      #    #        
          #     # #    # #    #    #  #  # #    # #   #  #      #    #    ### 
           #####  #    # #    #     ## ##   ####  #    # ###### #####     ###
                                                                                                                                                                                                                                            
copy right by Myguddy from http://patorjk.com/software/taag/#p=display&f=Old%20Banner&t=Welcome%20to
</pre>


** Vagrant SSH 환경을 로컬에서 동일하게 사용하기 위해
아래와 같은 명령어로 ssh 설정을 잡아줌
vagrant ssh-config [node name] >> ~/.ssh/config

ssh [node name] 으로 로그인 할 수 있음



kubeadm join --token ddc635.7c3fbb93908ce3fc 10.0.2.15:6443 --discovery-token-ca-cert-hash sha256:7f25b5988ccca3baaeaec82f710aa55143c0d1b020fd9224b303d8263cf4daeb


kubeadm init --pod-network-cidr=192.168.0.0/16 --apiserver-advertise-address=172.168.0.10

## Create service account

### Examples of possible operations over these resources are:

create
get
delete
list
update
edit
watch
exec

#### steps for user: employee, group=bitnami
* kubectl create namespace office
* openssl genrsa -out employee.key 2048
* openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=bitnami"
* cluster ca: CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key
* openssl x509 -req -in employee.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out employee.crt -days 500
* kubectl config set-credentials employee --client-certificate=/home/employee/.certs/employee.crt  --client-key=/home/employee/.certs/employee.key
* kubectl config set-context employee-context --cluster=minikube --namespace=office --user=employee

