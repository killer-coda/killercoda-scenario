
## Install prometheus operator  
RUN `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`{{exec}}    

RUN `helm repo add stable https://charts.helm.sh/stable && helm repo update`{{exec}}    

RUN `helm install prometheus prometheus-community/kube-prometheus-stack`{{exec}}    

RUN `kubecolor get po -A`{{exec}}    

## Install kindling  
RUN `git clone https://github.com/CloudDectective-Harmonycloud/kindling && cd kindling/deploy/agent/ && bash install.sh`{{exec}}   

RUN `kubectl set image ds/kindling-agent kindling-agent=hbstarjason/kindling-agent:bymyself -n kindling`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    

##
RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   

RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubectl set image deploy/nginx nginx=nginx:latest -n default`{{exec}}    

RUN `kubecolor get po -A`{{exec}}    


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
