
## Install prometheus operator  
RUN `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`{{exec}}    

RUN `helm repo add stable https://charts.helm.sh/stable && helm repo update`{{exec}}    

RUN `helm install prometheus prometheus-community/kube-prometheus-stack`{{exec}}    

RUN `kubecolor get po -A`{{exec}}    

## Install kindling  
RUN `git clone https://github.com/CloudDectective-Harmonycloud/kindling && cd kindling/deploy/agent/ && bash install.sh`{{exec}}   

RUN `kubectl set image ds/kindling-agent kindling-agent=hbstarjason/kindling-agent:bymyself -n kindling`{{exec}}   

RUN `kubecolor get po -A`{{exec}}   

## Install 
RUN `kubectl create -f https://k8s-bpf-probes-public.oss-cn-hangzhou.aliyuncs.com/kindling-grafana.yaml -n kindling`{{exec}}   

RUN `kubectl get svc -n kindling | grep grafana`{{exec}}   

RUN `kubectl patch svc grafana  -n kindling --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'`{{exec}}    

RUN `kubectl port-forward -n kindling --address=0.0.0.0 service/grafana 3000:3000 > /dev/null 2>&1 &`{{exec}}    

[ACCESS PORTS]({{TRAFFIC_SELECTOR}})

## Test
RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   

RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubectl set image deploy/nginx nginx=nginx:latest -n default`{{exec}}    

RUN `kubecolor get po -A`{{exec}}    


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
