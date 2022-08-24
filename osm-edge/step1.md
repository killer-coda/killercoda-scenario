RUN `kubectl taint nodes controlplane node-role.kubernetes.io/master:NoSchedule-  &&  kubectl taint nodes controlplane node-role.kubernetes.io/control-plane:NoSchedule-`{{exec}}   

## osm-edge CLI Install  

RUN `system=$(uname -s | tr [:upper:] [:lower:]) ; arch=$(dpkg --print-architecture) ; release=v1.1.1`{{exec}}   

RUN `curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
`{{exec}} 

RUN `cp ./${system}-${arch}/osm /usr/local/bin/ && osm version`{{exec}} 


## osm-edge Install   

RUN `export osm_namespace=osm-system ; export osm_mesh_name=osm`{{exec}}   

RUN `osm install --mesh-name "$osm_mesh_name" --osm-namespace "$osm_namespace" --set=osm.enablePermissiveTrafficPolicy=true --set=osm.deployPrometheus=true  --set=osm.deployGrafana=true --set=osm.deployJaeger=true --set=osm.tracing.enable=true --set=fsm.enabled=true  > /dev/null 2>&1 &`{{exec}}   

RUN `kubecolor get po -n osm-system`{{exec}}  





RUN `kubectl create deployment nginx --image=nginx:alpine`{{exec}}   
RUN `kubectl create service nodeport nginx --tcp=80:80`{{exec}}   

RUN `kubecolor get po -A`{{exec}}    



[ACCESS PORTS]({{TRAFFIC_SELECTOR}})
