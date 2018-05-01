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

## Required SW
* Vagrant : https://www.vagrantup.com/downloads.html
* Vagrant Host manager : vagrant plugin install vagrant-hostmanager
* virtualbox : https://www.virtualbox.org/
* ansible: brew install ansible
* kubectl : brew install kubectl


## tested environment
* Host OS: maxOS High Sierra 10.13.3
* Homebrew : Homebrew 1.6.0
* Virtualbox : 5.2.8 r121009 
* vagrant : 2.0.3
* ansible : 2.5.0


## How to run k8s(one master and three workers)
1. change contents of 'VagrantFile' : IPs or Number of worker node
   * Master: 2 cpu, 3072MB, 172.168.50.10
   * Worker: 3 node, 4 cpu, 3072MB, 172.168.50.21~23
1. vagrant up: install docker, k8s binary, and required sw
1. run shell script
   1. ./k8s-init.sh [master name, k8s] : kubeadm init, setup kubeconfig in local
   2. ./k8s-cni.sh [master name, k8s]: install overlay network-calico
   3. Join worker node in cluster
      * ./k8s-join.sh [master name, k8s] [worker name, k8s1]
      * ./k8s-join.sh [master name, k8s] [worker name, k8s2]
      * ./k8s-join.sh [master name, k8s] [worker name, k8s3]
1. make dashboard : install dashboard, https://k8s.nogada.dev:30000
3. make helm : install helm
4. make ingress: install ingress controller

### installed apps in kubernetes
* kubernetes dashboard : https://[master-ip]:30000
* grafana : http://[master-ip]:30001



### more function
* save current status and suspend : vagrant suspend
* resume vms : vagrant resume
* power off: vagrant halt
* boot : vagrant up
* destroy vms: vagrant destroy
* cf: if want execute on specific vm, then vagrant up [name of host in VagrantFile]