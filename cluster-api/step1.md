## cluster-api


RUN `clusterctl version`{{exec}}

RUN `kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.22/deploy/local-path-storage.yaml`{{exec}}   

RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   

RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
