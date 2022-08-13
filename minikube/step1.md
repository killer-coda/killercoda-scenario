## minikube

RUN `minikube version`{{exec}}   

RUN `minikube status`{{exec}}

RUN `minikube addons list`{{exec}}       

RUN `kubecolor get po -A`{{exec}}    

RUN `minikube addons enable ingress metrics-server`{{exec}}    

RUN `minikube addons list`{{exec}}    

RUN `kubecolor get po -A`{{exec}} 


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
