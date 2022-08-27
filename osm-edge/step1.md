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

## Deploy book demo 

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

### Test1：访问控制
>目标：禁止 bookthief 从 bookstore 偷书，不影响书籍的正常购买。    

关闭宽松流量策略模式，检查 bookthief 和 bookbuyer 的计数器。      
RUN `kubectl patch meshconfig osm-mesh-config -n osm-system -p '{"spec":{"traffic":{"enablePermissiveTrafficPolicyMode":false}}}'  --type=merge
`{{exec}}    

允许正常的访问，然后检查页面上计数器的变化。        
RUN `kubectl apply -f https://raw.githubusercontent.com/flomesh-io/osm-edge-docs/release-v1.1/manifests/access/traffic-access-v1.yaml
`{{exec}}    

### Test2：灰度发布  
>目标：实现灰度发布。

部署 bookstore-v2 版本。                  
RUN `kubectl apply -f https://raw.githubusercontent.com/flomesh-io/osm-edge-docs/main/manifests/apps/bookstore-v2.yaml`{{exec}}   

RUN `POD="$(kubectl get pods --selector app="bookstore-v2" -n bookstore --no-headers | grep 'Running' | awk 'NR==1{print $1}')" && kubectl port-forward "$POD" -n bookstore 8082:14001 --address 0.0.0.0 > /dev/null 2>&1`{{exec}}     

URL:[Access Tekton]({{TRAFFIC_HOST1_8082}})    

初始化流量拆分策略。         
RUN `kubectl apply -f https://raw.githubusercontent.com/flomesh-io/osm-edge-docs/main/manifests/split/traffic-split-v1.yaml
`{{exec}}    

将 50% 的流量放行到 bookstore-v2 中。       
RUN `kubectl apply -f https://raw.githubusercontent.com/flomesh-io/osm-edge-docs/main/manifests/split/traffic-split-50-50.yaml
`{{exec}}       

将所有流量导入 bookstore-v2中。      
RUN `kubectl apply -f https://raw.githubusercontent.com/flomesh-io/osm-edge-docs/main/manifests/split/traffic-split-v2.yaml
`{{exec}}    




[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
