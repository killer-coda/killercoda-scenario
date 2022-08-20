## Linkerd

RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}    

RUN `curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh`{{exec}}  

RUN `cp /root/.linkerd2/bin/linkerd /usr/local/bin/ && linkerd  version`{{exec}}     

RUN `linkerd check --pre`{{exec}}    

RUN `linkerd install | kubectl apply -f -`{{exec}} 

RUN `kubecolor get pods -n linkerd`{{exec}}   

RUN `linkerd check`{{exec}}    

RUN `curl -fsL https://run.linkerd.io/emojivoto.yml | kubectl apply -f -`{{exec}} 

RUN `kubecolor get pods -n emojivoto`{{exec}}   

RUN `kubecolor get svc -n emojivoto`{{exec}} 

RUN `kubectl -n emojivoto port-forward --address=0.0.0.0 svc/web-svc 80:80 > /dev/null 2>&1 &`{{exec}}  

RUN `kubectl get -n emojivoto deploy -o yaml | linkerd inject - | kubectl apply -f -`{{exec}} 

RUN `kubecolor get pods -n emojivoto`{{exec}}  

RUN `linkerd -n emojivoto check --proxy`{{exec}} 

RUN `linkerd viz install | kubectl apply -f -`{{exec}}  

RUN `kubecolor get pods -n linkerd-viz`{{exec}}  

RUN `kubecolor get svc -n linkerd-viz`{{exec}}   

RUN `kubectl -n linkerd-viz port-forward --address=0.0.0.0 svc/grafana 3000:3000 > /dev/null 2>&1 &`{{exec}}     

RUN `kubectl -n linkerd-viz port-forward --address=0.0.0.0 svc/prometheus 9090:9090 > /dev/null 2>&1 &`{{exec}}   

RUN `kubectl -n linkerd-viz port-forward --address=0.0.0.0 svc/web 8084:8084 > /dev/null 2>&1 &`{{exec}}   


RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
