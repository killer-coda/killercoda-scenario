RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}   

## osm-edge CLI Install  

RUN `system=$(uname -s | tr [:upper:] [:lower:]) ; arch=$(dpkg --print-architecture) ; release=v1.1.1`{{exec}}   

RUN `curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
`{{exec}} 

RUN `cp ./${system}-${arch}/osm /usr/local/bin/ && osm version`{{exec}} 


## osm-edge Install   

RUN `export osm_namespace=osm-system ;export osm_mesh_name=osm`{{exec}}   

RUN `osm install --mesh-name "$osm_mesh_name" --osm-namespace "$osm_namespace" --set=osm.enablePermissiveTrafficPolicy=true --set=fsm.enabled=true`{{exec}}   
RUN `kubecolor get po -n osm-system`{{exec}}  

## setup book demo 

RUN `kubectl create namespace bookstore`{{exec}} 

RUN `kubectl create namespace bookbuyer`{{exec}} 

RUN `kubectl create namespace bookthief`{{exec}}   

RUN `kubectl create namespace bookwarehouse`{{exec}}    

RUN `osm namespace add bookstore bookbuyer bookthief bookwarehouse`{{exec}}  

RUN `osm metrics enable --namespace "bookstore,bookbuyer,bookthief,bookwarehouse"`{{exec}} 

RUN `git clone https://github.com/flomesh-io/osm-edge-docs && cd osm-edge-docs/manifests/apps`{{exec}} 

RUN `kubectl apply -f bookbuyer.yaml && kubectl apply -f bookthief.yaml && kubectl apply -f bookstore.yaml && kubectl apply -f bookwarehouse.yaml && mysql.yaml`{{exec}} 

RUN `kubecolor get po -A`{{exec}} 


## Test 
RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
