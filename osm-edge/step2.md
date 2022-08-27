## osm-edge 

RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}  
