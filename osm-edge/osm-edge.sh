### osm-edge

### https://osm-edge-docs.flomesh.io/zh/docs/quickstart/

### https://github.com/flomesh-io/flomesh-workshop/blob/main/flomesh/101-quickstart.md

system=$(uname -s | tr [:upper:] [:lower:])
arch=$(dpkg --print-architecture)
release=v1.1.1
curl -L https://github.com/flomesh-io/osm-edge/releases/download/${release}/osm-edge-${release}-${system}-${arch}.tar.gz | tar -vxzf -
./${system}-${arch}/osm version
cp ./${system}-${arch}/osm /usr/local/bin/

export osm_namespace=osm-system 
export osm_mesh_name=osm 

osm install \
    --mesh-name "$osm_mesh_name" \
    --osm-namespace "$osm_namespace" \
    --set=osm.enablePermissiveTrafficPolicy=true \
    --set=osm.deployPrometheus=true \
    --set=osm.deployGrafana=true \
    --set=osm.deployJaeger=true \
    --set=osm.tracing.enable=true \
    --set=fsm.enabled=true
    
 
 kubectl get po -n osm-system
 
 
#### curl -sfL https://getk8e.com/install.sh | K8E_TOKEN=k8e-mesh INSTALL_K8E_EXEC="server --cluster-init --write-kubeconfig-mode 644 --write-kubeconfig ~/.kube/config" sh -
