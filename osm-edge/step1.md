## osm-edge CLI Install 

RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}    

RUN `system=$(uname -s | tr [:upper:] [:lower:]) ; arch=$(dpkg --print-architecture) ; release=v1.1.1`{{exec}}   

RUN `curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
`{{exec}} 

RUN `cp ./${system}-${arch}/osm /usr/local/bin/ && osm version`{{exec}} 

RUN ``{{exec}} 





RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})