## Install minikube

RUN `minikube`{{exec}}   

RUN `minikube start --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1`{{exec}}

RUN `minikube addons list`{{exec}}       


RUN `kubectl get po -A`{{exec}}


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
