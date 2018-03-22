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

## optional SW
* vagrant-hostsupdater: vagrant install vagrant-hostsupdater
  vagrant vm host명을 로컬 hosts에 자동으로 추가 삭제(vm 삭제시)

## tested environment
* Host OS: maxOS High Sierra 10.13.3
* Homebrew : Homebrew 1.5.3
* Virtualbox : 5.2.8 r121009 
* vagrant : 2.0.2
* ansible : 2.4.3.0


## How to run k8s(one master and one worker)
1. change contents of 'VagrantFile' : IPs or Number of worker node
1. vagrant up k8s (for better performance)
1. vagrant up k8s1 (1~n in VagrantFile)
1. make all
1. goto kubernetes dashboard and click 'skip' to sign in

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