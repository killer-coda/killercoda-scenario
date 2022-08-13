## minikube

RUN `minikube version`{{exec}}   

RUN `minikube status`{{exec}}

RUN `minikube addons list`{{exec}}       

RUN `kubecolor get po -A`{{exec}}    

RUN `minikube addons enable ingress metrics-server`{{exec}}    

RUN `minikube addons list`{{exec}}    

RUN `kubecolor get po -A`{{exec}}  

## cilium

RUN `cilium version`{{exec}}     

RUN `cilium install`{{exec}}   

RUN `cilium status --wait`{{exec}}  

RUN `cilium hubble enable --ui`{{exec}}    

RUN `kubectl port-forward -n kube-system  --address=0.0.0.0 service/hubble-ui 80:80 > /dev/null 2>&1 &`{{exec}}   

[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
