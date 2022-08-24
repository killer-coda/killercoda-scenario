RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}   

## osm-edge CLI Install  

RUN `system=$(uname -s | tr [:upper:] [:lower:]) ; arch=$(dpkg --print-architecture) ; release=v1.1.1`{{exec}}   

RUN `curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
`{{exec}} 

RUN `cp ./${system}-${arch}/osm /usr/local/bin/ && osm version`{{exec}} 


## osm-edge Install   

RUN `helm repo add fsm https://charts.flomesh.io`{{exec}}   

RUN `export fsm_namespace=osm-system`{{exec}}   

RUN `helm install fsm fsm/fsm --namespace "$fsm_namespace" --create-namespace`{{exec}}  

RUN `kubecolor get po -n osm-system`{{exec}}  

## setup book demo 

RUN `kubectl create namespace bookstore`{{exec}} 

RUN `kubectl create namespace bookbuyer`{{exec}} 

RUN `kubectl create namespace bookthief`{{exec}}   

RUN `kubectl create namespace bookwarehouse`{{exec}}    

RUN `osm namespace add bookstore bookbuyer bookthief bookwarehouse`{{exec}}  

RUN `osm metrics enable --namespace "bookstore,bookbuyer,bookthief,bookwarehouse"`{{exec}} 



## Test 
RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
