RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}   

## osm-edge CLI Install  

RUN `system=$(uname -s | tr [:upper:] [:lower:]) ; arch=$(dpkg --print-architecture) ; release=v1.1.1`{{exec}}   

RUN `curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
`{{exec}} 

RUN `cp ./${system}-${arch}/osm /usr/local/bin/ && osm version`{{exec}} 


## osm-edge Install   

RUN `export osm_namespace=osm-system ;export osm_mesh_name=osm`{{exec}}   

RUN `osm install --mesh-name "$osm_mesh_name" --osm-namespace "$osm_namespace" --set=osm.enablePermissiveTrafficPolicy=true`{{exec}}   
RUN `kubecolor get po -n osm-system`{{exec}}  

## setup book demo 

RUN `kubectl create namespace bookstore`{{exec}} 

RUN `kubectl create namespace bookbuyer`{{exec}} 

RUN `kubectl create namespace bookthief`{{exec}}   

RUN `kubectl create namespace bookwarehouse`{{exec}}    

RUN `osm namespace add bookstore bookbuyer bookthief bookwarehouse`{{exec}}  

RUN `osm metrics enable --namespace "bookstore,bookbuyer,bookthief,bookwarehouse"`{{exec}} 

RUN `git clone https://github.com/flomesh-io/osm-edge-docs && cd osm-edge-docs/manifests/apps`{{exec}} 

RUN `kubectl apply -f bookbuyer.yaml && kubectl apply -f bookthief.yaml && kubectl apply -f bookstore.yaml && kubectl apply -f bookwarehouse.yaml && kubectl apply -f mysql.yaml`{{exec}} 

RUN `kubecolor get po -A`{{exec}} 


## Test   
RUN `POD="$(kubectl get pods --selector app=bookbuyer -n bookbuyer --no-headers  | grep 'Running' | awk 'NR==1{print $1}')" && kubectl port-forward "$POD" -n bookbuyer 8080:14001 --address 0.0.0.0 > /dev/null 2>&1`{{exec}}   

URL:[Access Tekton]({{TRAFFIC_HOST1_8080}}) 


RUN `POD="$(kubectl get pods --selector app=bookthief -n bookthief --no-headers | grep 'Running' | awk 'NR==1{print $1}')" && kubectl port-forward "$POD" -n bookthief 8083:14001 --address 0.0.0.0 > /dev/null 2>&1`{{exec}} 
URL:[Access Tekton]({{TRAFFIC_HOST1_8083}})  


[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
