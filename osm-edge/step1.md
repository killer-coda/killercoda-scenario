## osm-edge

RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}    

RUN ``{{exec}}   

RUN ``{{exec}} 

RUN ``{{exec}} 

RUN ``{{exec}} 





RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
