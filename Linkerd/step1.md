## Linkerd


RUN `curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh`{{exec}}    





RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   

RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
