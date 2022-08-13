## Install minikube

RUN `minikube version`{{exec}}   

RUN `minikube start --extra-config=kubeadm.ignore-preflight-errors=NumCPU --cni=cilium --kubernetes-version=v1.23.3 --force --cpus=1`{{exec}}

RUN `minikube addons list`{{exec}}       


RUN `kubectl get po -A`{{exec}}


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
